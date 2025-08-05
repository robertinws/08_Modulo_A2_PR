package com.example.modulo_a2_pr;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.hardware.biometrics.BiometricManager;
import android.hardware.biometrics.BiometricPrompt;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.CancellationSignal;
import android.util.Base64;
import android.widget.Toast;
import androidx.annotation.NonNull;
import java.util.List;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    String caminhoCanal = "com.example.modulo_a2_pr";
    private BroadcastReceiver broadInternet;
    private CancellationSignal cancellationSignal;
    private boolean biometriaValidada = false;

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(broadInternet);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor(), caminhoCanal + "/main").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {

                List<Object> args = call.arguments();

                switch (call.method) {

                    case "toast":

                        if (args != null) {

                            String mensagem = args.get(0).toString();
                            Toast.makeText(MainActivity.this, mensagem, Toast.LENGTH_SHORT).show();

                        }

                        break;

                    case "token":

                        if (args != null) {

                            String token = args.get(0).toString();
                            String[] divideToken = token.split("\\.");
                            byte[] bytes = Base64.decode(divideToken[1], Base64.DEFAULT);
                            result.success(new String(bytes));

                        }

                        break;

                    case "mantenhaConectado":

                        if (args != null) {

                            boolean conectado = Boolean.parseBoolean(args.get(0).toString());

                            SharedPreferences.Editor editor = getSharedPreferences("main", MODE_PRIVATE).edit();
                            editor.putBoolean("conectado", conectado);
                            editor.apply();
                            result.success("sucesso");
                        }

                        break;

                    case "mantenhaConectadoReceber":

                        SharedPreferences sharedPreferences = getSharedPreferences("main", MODE_PRIVATE);
                        boolean conectado = sharedPreferences.getBoolean("conectado", false);
                        result.success(conectado);

                        break;

                    case "salvarToken":

                        if (args != null) {

                            String token = args.get(0).toString();
                            SharedPreferences.Editor editor = getSharedPreferences("main", MODE_PRIVATE).edit();
                            editor.putString("token", token);
                            editor.apply();
                            result.success("sucesso");

                        }

                        break;

                    case "receberToken":

                        SharedPreferences sharedPreferences1 = getSharedPreferences("main", MODE_PRIVATE);
                        String token = sharedPreferences1.getString("token", "");
                        result.success(token);

                        break;

                    case "biometria":

                        cancellationSignal = new CancellationSignal();
                        biometriaValidada = false;

                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                            BiometricPrompt biometricPrompt = new BiometricPrompt.Builder(getContext()).setTitle("Validação biométrica").setDescription("Confirme sua biometria para fazer login").setNegativeButton("Cancelar", getMainExecutor(), new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface dialog, int which) {

                                }
                            }).build();

                            biometricPrompt.authenticate(cancellationSignal, getMainExecutor(), new BiometricPrompt.AuthenticationCallback() {
                                @Override
                                public void onAuthenticationError(int errorCode, CharSequence errString) {
                                    super.onAuthenticationError(errorCode, errString);
                                    cancellationSignal.cancel();
                                }

                                @Override
                                public void onAuthenticationSucceeded(BiometricPrompt.AuthenticationResult result) {
                                    super.onAuthenticationSucceeded(result);
                                    biometriaValidada = true;
                                    cancellationSignal.cancel();
                                }

                                @Override
                                public void onAuthenticationFailed() {
                                    super.onAuthenticationFailed();
                                    cancellationSignal.cancel();
                                }
                            });

                            cancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener() {
                                @Override
                                public void onCancel() {
                                    result.success(biometriaValidada);
                                }
                            });

                        }

                        break;

                }

            }
        });

        new EventChannel(flutterEngine.getDartExecutor(), caminhoCanal + "/internet").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                events.success(verificarConexao());
                broadInternet = new BroadcastReceiver() {
                    @Override
                    public void onReceive(Context context, Intent intent) {
                        events.success(verificarConexao());
                    }
                };
                registerReceiver(broadInternet, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
            }

            @Override
            public void onCancel(Object arguments) {

            }
        });

    }

    private int verificarConexao() {

        int conexao = 0;

        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();

        if (networkInfo != null) {

            switch (networkInfo.getState()) {

                case CONNECTED:
                    conexao = 1;
                    break;

                default:
                    conexao = 0;
                break;

            }

        }

        return conexao;

    }

}