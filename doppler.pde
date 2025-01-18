ArrayList<Ripple> ripples;

void setup() {
  size(800, 800); 
  background(0);
  ripples = new ArrayList<Ripple>();
}

void draw() {
  // Add a slightly transparent background for a fading effect
  background(0, 25); 
  
  // Update and display all ripples
  for (int i = ripples.size() - 1; i >= 0; i--) {
    Ripple r = ripples.get(i);
    r.update();
    r.display();
    
    // Remove ripple if it has faded out
    if (r.isFaded()) {
      ripples.remove(i);
    }
  }
}

void mousePressed() {
  // Add a new ripple at the mouse position
  ripples.add(new Ripple(mouseX, mouseY));
}

class Ripple {
  float x, y;         // Position of the ripple
  float radius;       // Current radius of the ripple
  float maxRadius;    // Maximum radius
  float alpha;        // Transparency of the ripple

  Ripple(float x, float y) {
    this.x = x;
    this.y = y;
    this.radius = 0;          // Start with a radius of 0
    this.maxRadius = 300;     // Set the maximum radius
    this.alpha = 255;         // Start fully opaque
  }

  void update() {
    radius += 2;             // Increase the radius
    alpha -= 255 / maxRadius; // Gradually reduce transparency
    if (alpha < 0) {
      alpha = 0;             // Ensure alpha doesn't go negative
    }
  }

  void display() {
    noFill();
    strokeWeight(2);
    stroke(100, 150, 255, alpha); // Light blue ripple
    ellipse(x, y, radius * 2, radius * 2); // Draw the expanding circle
  }

  boolean isFaded() {
    return alpha <= 0; // Check if ripple has faded completely
  }
}
