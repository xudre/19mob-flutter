package br.com.fiap.flutter_19mob

import io.flutter.embedding.android.FlutterActivity
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent

class MainActivity: FlutterActivity() {

    private val CHANNEL = "app/share"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        //criamos um ouvinte que responde a chamadas do código DART
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            val value: String? = call.argument("value")
            val intent = Intent()
            intent.action = Intent.ACTION_SEND
            intent.putExtra(Intent.EXTRA_TEXT, value)
            intent.setType("text/plain")
            startActivity(intent)
            result.success("")
        }
    }
}
