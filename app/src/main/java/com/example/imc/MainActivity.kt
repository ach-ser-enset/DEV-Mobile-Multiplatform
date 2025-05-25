package com.example.imc

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.imc.ui.theme.IMCTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            IMCTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = Color(0xFFF7F1FF)
                ) {
                    BMICalculatorUI()
                }
            }
        }
    }
}

@Composable
fun BMICalculatorUI() {
    var weight by remember { mutableStateOf("") }
    var height by remember { mutableStateOf("") }
    var bmi by remember { mutableStateOf<Double?>(null) }

    val category = when {
        bmi == null -> ""
        bmi!! < 18.5 -> "Maigreur"
        bmi!! < 25 -> "Normal"
        bmi!! < 30 -> "Surpoids"
        bmi!! < 40 -> "Obésité modérée"
        else -> "Obésité sévère"
    }

    val imageRes = when (category) {
        "Maigreur" -> R.drawable.maigre
        "Normal" -> R.drawable.normal
        "Surpoids" -> R.drawable.surpoids
        "Obésité modérée" -> R.drawable.obese
        "Obésité sévère" -> R.drawable.t_obese
        else -> null
    }

    Column(
        modifier = Modifier
            .padding(20.dp)
            .fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text("Calculateur d’IMC", fontSize = 24.sp, fontWeight = FontWeight.Bold)
        Spacer(modifier = Modifier.height(20.dp))

        OutlinedTextField(
            value = weight,
            onValueChange = { weight = it },
            label = { Text("Poids (Kg)") },
            modifier = Modifier.fillMaxWidth()
        )

        OutlinedTextField(
            value = height,
            onValueChange = { height = it },
            label = { Text("Taille (cm)") },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(modifier = Modifier.height(20.dp))

        Button(onClick = {
            val w = weight.toDoubleOrNull()
            val h = height.toDoubleOrNull()
            if (w != null && h != null && h > 0) {
                val heightMeters = h / 100
                bmi = w / (heightMeters * heightMeters)
            }
        }) {
            Text("Calculer IMC")
        }

        Spacer(modifier = Modifier.height(20.dp))

        bmi?.let {
            Text("Votre IMC est : %.2f".format(it), fontSize = 18.sp)
            Spacer(modifier = Modifier.height(10.dp))
            imageRes?.let { res ->
                Image(
                    painter = painterResource(res),
                    contentDescription = category,
                    modifier = Modifier.size(150.dp)
                )
            }
            Spacer(modifier = Modifier.height(10.dp))
            Text(category, fontSize = 20.sp, fontWeight = FontWeight.Bold)
        }
    }
}
