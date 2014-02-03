package com.example.sensors;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.app.Activity;
import android.widget.TextView;
import android.widget.FrameLayout;
import com.example.sensors.CustomCameraView;

public class MainActivity extends Activity implements SensorEventListener {
	 
SensorManager sensorManager = null;
 
//for accelerometer values
TextView outputX;
TextView outputY;
TextView outputZ;
 
//for orientation values
TextView outputX2;
TextView outputY2;
TextView outputZ2;
 
 @Override
 public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    sensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
    setContentView(R.layout.activity_main);
 
    //just some textviews, for data output
    outputX = (TextView) findViewById(R.id.TextView01);
    outputY = (TextView) findViewById(R.id.TextView02);
    outputZ = (TextView) findViewById(R.id.TextView03);
 
    outputX2 = (TextView) findViewById(R.id.TextView04);
    outputY2 = (TextView) findViewById(R.id.TextView05);
    outputZ2 = (TextView) findViewById(R.id.TextView06);
    
    
    
    
    //----------------------------------------------------------------------
    try{
        super.onCreate(savedInstanceState);
        CustomCameraView cv = new CustomCameraView(this.getApplicationContext());
        FrameLayout rl = new FrameLayout(this.getApplicationContext());
        setContentView(rl);
        rl.addView(cv);
                
     } catch(Exception e){}
    
    
 }
    

 
 @Override
 protected void onResume() {
    super.onResume();
    sensorManager.registerListener(this, sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE), SensorManager.SENSOR_DELAY_GAME);
    sensorManager.registerListener(this, sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER), SensorManager.SENSOR_DELAY_GAME);
 }
 
 public void onSensorChanged(SensorEvent event) {
	    synchronized (this) {
	        switch (event.sensor.getType()){
	            case Sensor.TYPE_GYROSCOPE:
	                outputX.setText("Gyro x:"+Float.toString(event.values[0]));
	                outputY.setText("Gyro y:"+Float.toString(event.values[1]));
	                outputZ.setText("Gyro z:"+Float.toString(event.values[2]));
	                break;
	            case Sensor.TYPE_ACCELEROMETER:
	                outputX2.setText("Acclr x:"+Float.toString(event.values[0]));
	                outputY2.setText("Acclr y:"+Float.toString(event.values[1]));
	                outputZ2.setText("Acclr z:"+Float.toString(event.values[2]));
	        break;
	 
	        }
	    }
	 }
 
@Override
public void onAccuracyChanged(Sensor sensor, int accuracy) {}  
}


    //-------------------------------------------------------------------------