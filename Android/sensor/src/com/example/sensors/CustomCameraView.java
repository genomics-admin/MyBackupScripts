package com.example.sensors;

import java.io.IOException;

import android.content.Context;
import android.graphics.ImageFormat;
import android.hardware.Camera;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

//---------------------------------------------------------------------------
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
      private static final int IMAGE_WIDTH = 300;//512;
      private static final int IMAGE_HEIGHT = 225;//384;

      //-----------------
      public void surfaceCreated(SurfaceHolder holder) {
    	  
          try {
              camera = Camera.open();
              camera.setDisplayOrientation(90);
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
          //camera.getParameters().setColorEffect("EFFECT_NEGATIVE");
          //params.setRotation(90);
          
          Camera.Size s = params.getSupportedPreviewSizes().get(0);
          params.setPreviewSize(s.width, s.height);
          	
          //params.setColorEffect(Camera.Parameters.EFFECT_NEGATIVE);
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
}
