package com.example.mycam;

import android.app.Activity;
import android.app.ActionBar;
import android.app.Fragment;
import android.content.Context;
import android.graphics.ImageFormat;
import android.graphics.PixelFormat;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.os.Build;
import android.widget.FrameLayout;
import android.hardware.Camera;
import android.view.Window;
import android.view.WindowManager;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.util.Log;

import java.io.IOException;

public class MyCam extends Activity {

    private static String TAG = "MyCam";

    private Context ctx;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
       /* super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        if (savedInstanceState == null) {
            getFragmentManager().beginTransaction()
                    .add(R.id.container, new PlaceholderFragment())
                    .commit();
        }*/
        try {
            super.onCreate(savedInstanceState);
            Log.i(TAG, "Yahoo!");
            CustomCameraView cv = new CustomCameraView(this.getApplicationContext());
            FrameLayout rl = new FrameLayout(
                    this.getApplicationContext());
            setContentView(rl);
            rl.addView(cv);
        } catch (Exception e) {
        }


    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.my_cam, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        switch (item.getItemId()) {
            case R.id.action_settings:
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

    /**
     * A placeholder fragment containing a simple view.
     */
    public static class PlaceholderFragment extends Fragment {

        public PlaceholderFragment() {
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container,
                                 Bundle savedInstanceState) {
            View rootView = inflater.inflate(R.layout.fragment_main, container, false);
            return rootView;
        }
    }

    public class CustomCameraView extends SurfaceView {
        Camera camera;
        SurfaceHolder previewHolder;
        /*public CustomCameraView(Context context)
        {
            super(context);
        }*/

        public CustomCameraView(Context ctx) {
            super(ctx);

            previewHolder = this.getHolder();
            previewHolder.addCallback(surfaceHolderListener);
        }


        SurfaceHolder.Callback surfaceHolderListener = new SurfaceHolder.Callback() {
            private static final int IMAGE_WIDTH = 512;
            private static final int IMAGE_HEIGHT = 384;

            //-----------------
            public void surfaceCreated(SurfaceHolder holder) {

                try {
                    camera = Camera.open();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                try {
                    camera.setPreviewDisplay(previewHolder);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            public void surfaceChanged(SurfaceHolder holder, int format, int width,
                                       int height) {
                Camera.Parameters params = camera.getParameters();
                params.setPictureSize(IMAGE_WIDTH, IMAGE_HEIGHT);

                //camera.getParameters().setRotation(90);

                Camera.Size s = params.getSupportedPreviewSizes().get(0);
                params.setPreviewSize(s.width, s.height);

                //params.setPreviewSize(w, h);
                //params.setPreviewSize(500,500);
                params.setPictureFormat(ImageFormat.JPEG);

                camera.setParameters(params);
                camera.startPreview();
            }

            public void surfaceDestroyed(SurfaceHolder arg0) {
                camera.stopPreview();
                camera.release();
                camera = null;
            }
        };

       /*
        public static SensorManager sensorMan;
        sensorMan=(SensorManager)getSystemService(SENSOR_SERVICE);
        mAccelerometer = mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        //sensorMan.getDefaultSensor(SensorManager.SENSOR_ORIENTATION)

        sensorMan.registerListener(listener,mAccelerometer,SensorManager.SENSOR_DELAY_FASTEST);*/

    }

    /*SensorEventListener listener = new SensorEventListener() {
        public void onAccuracyChanged(Sensor arg0, int arg1){}
        public void onSensorChanged(SensorEvent evt) {
            float vals[] = evt.values;
            float direction = vals[0];
            Log.d(TAG,"Directions = ");
            Log.d(TAG,Float.toString(direction));

        }
    };*/

    public class SensorActivity extends Activity implements SensorEventListener {
        private final SensorManager mSensorManager;
        private final Sensor mAccelerometer;

        public SensorActivity() {
            mSensorManager = (SensorManager)getSystemService(SENSOR_SERVICE);
            mAccelerometer = mSensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        }

        protected void onResume() {
            super.onResume();
            mSensorManager.registerListener(this, mAccelerometer, SensorManager.SENSOR_DELAY_NORMAL);
        }

        protected void onPause() {
            super.onPause();
            mSensorManager.unregisterListener(this);
        }

        public void onAccuracyChanged(Sensor sensor, int accuracy) {
        }

        public void onSensorChanged(SensorEvent evt) {
            float vals[] = evt.values;
            float direction = vals[0];
            Log.d(TAG,"Directions = ");
            Log.d(TAG,Float.toString(direction));
        }
    }
}
