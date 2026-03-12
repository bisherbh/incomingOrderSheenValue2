package com.hiennv.flutter_callkit_incoming

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import java.util.*
import android.content.SharedPreferences

class TransparentActivity : Activity() {

    companion object {

        fun getIntentAccept(context: Context, data: Bundle?): Intent {
            val intent = Intent(context, TransparentActivity::class.java)
            intent.putExtra("data", data)
            intent.putExtra("type", "ACCEPT")
            intent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
            intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
            intent.data = Uri.parse(UUID.randomUUID().toString())
            return intent
        }

        fun getIntentCallback(context: Context, data: Bundle?): Intent {
            val intent = Intent(context, TransparentActivity::class.java)
            intent.putExtra("data", data)
            intent.putExtra("type", "CALLBACK")
            intent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
            intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
            intent.data = Uri.parse(UUID.randomUUID().toString())
            return intent
        }

    }


    override fun onStart() {
        super.onStart()
        setVisible(true)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        when (intent.getStringExtra("type")) {
            "ACCEPT" -> {
                val data = intent.getBundleExtra("data")
                try {
                    @Suppress("UNCHECKED_CAST")
                    val map = data?.getSerializable("EXTRA_CALLKIT_EXTRA") as? HashMap<String, Any?>
                    val caseId = map?.get("case_id") as? String ?: ""
                    if (caseId.isNotEmpty()) {
                        val prefs: SharedPreferences = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
                        prefs.edit().putString("flutter.case_id", caseId).commit()
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                }
                val acceptIntent = CallkitIncomingBroadcastReceiver.getIntentAccept(this@TransparentActivity, data)
                sendBroadcast(acceptIntent)
            }
            "CALLBACK" -> {
                val data = intent.getBundleExtra("data")
                val acceptIntent = CallkitIncomingBroadcastReceiver.getIntentCallback(this@TransparentActivity, data)
                sendBroadcast(acceptIntent)
            }
            else -> {
                val data = intent.getBundleExtra("data")
                val acceptIntent = CallkitIncomingBroadcastReceiver.getIntentAccept(this@TransparentActivity, data)
                sendBroadcast(acceptIntent)
            }
        }
        finish()
        overridePendingTransition(0, 0)
    }
}