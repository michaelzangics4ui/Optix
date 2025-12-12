class rotateRight extends Tool {
    
    rotateRight (float s) {
        super(s);
        type = "rotateRight";
    }
    
        void update() {    
          if (rotationCount >= 1) {
              println("Can only rotate right once!");
              println("You can rotate left to go back, or use RESET.");
              currentTool = new Tool(1);
              return;
          }
          
          int newWidth = fullImage.height; // What width will be after rotation
          int newHeight = fullImage.width; // What height will be after rotation

          if(newWidth > width || newHeight > (height-200)){
            println("Photo is too zoomed in to rotate - it won't fit on screen!");
            println("Please zoom out if you would like to rotate this image.");
            currentTool = new Tool(1);
            return; 
          }
          fill(255);
          noStroke();
          rect(0, 200, width, height - 200); //essential to clear previous photo

          float centerX = width/2;
          float centerY = 200 + ((height-200)/2);
            
          pushMatrix();
          translate(centerX, centerY);
          rotate(radians(90));
          imageMode(CENTER); // makes sure the image rotates around the center and doesn't appear at the bottom of the screen
          image(fullImage,0,0);
          imageMode(CORNER); // makes the image appear on the corner to stay consistent prior to rotating
          popMatrix();
          
          
          fullImage = get(int(centerX - newWidth/2), int(centerY - newHeight/2), newWidth, newHeight);
          rotationCount++;
          
          fill(255);
          noStroke();
                  
          currentTool = new Tool(1);
        }
    }
    
class rotateLeft extends Tool {
    
    rotateLeft (float s) {
        super(s);
        type = "rotateLeft";
    }
    
        void update() {    
          if (rotationCount <= -1) {
              println("Can only rotate left once!");
              println("You can rotate right to go back, or use RESET.");
              currentTool = new Tool(1);
              return;
          }
          
          int newWidth = fullImage.height; // What width will be after rotation
          int newHeight = fullImage.width; // What height will be after rotation

          if(newWidth > width || newHeight > (height-200)){
            println("Photo is too zoomed in to rotate - it won't fit on screen!");
            println("Please zoom out if you would like to rotate this image.");
            currentTool = new Tool(1);
            return; 
          }
          fill(255);
          noStroke();
          rect(0, 200, width, height - 200); //essential to clear previous photo

          float centerX = width/2;
          float centerY = 200 + ((height-200)/2);
            
          pushMatrix();
          translate(centerX, centerY);
          rotate(radians(-90));
          imageMode(CENTER); // makes sure the image rotates around the center and doesn't appear at the bottom of the screen
          image(fullImage,0,0);
          imageMode(CORNER); // makes the image appear on the corner to stay consistent prior to rotating
          popMatrix();
          
          
          fullImage = get(int(centerX - newWidth/2), int(centerY - newHeight/2), newWidth, newHeight);
          rotationCount--;
          
          fill(255);
          noStroke();
                  
          currentTool = new Tool(1);
        }
    }
