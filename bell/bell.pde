String[] quantumCorpusLoad;
String[] finalQuantumArray;
color black = color(0);
color white = color(255);
int bottom = 1000; //how far down the bottom canvas should start. there are 1000 shots, so start 1000px down

void setup() {
  size(50,40);
  loadPixels();
  parseCorpus();
  colorPixels();
  
  //export image to same folder as this file
  //note that the export will be tiny (50px by 40px).  
  //Scale it up in photoshop using nearests neighboring resampling to get nice hard edges.
  save("pixel_art.png");
  println("exported!");

}

void parseCorpus() {
  quantumCorpusLoad = loadStrings("corpus.txt");
  finalQuantumArray = quantumCorpusLoad[0].replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");
}


//Color the pixels based on the corpus. The 0th qubit (right digit)
//determines the position, being either the top canvas or the bottom canvas.
//the 1st qubit (left digit) determines the color of the qubit.
//I admit the code below is a lazy way achieving the desired effect, but it works.
void colorPixels() {
  for (int i = 0; i < finalQuantumArray.length; i = i+1) {
    if (finalQuantumArray[i].equals("'00'")) {
      pixels[i] = black;
    } else if (finalQuantumArray[i].equals("'11'")) {
      pixels[i + bottom] = white;
    }
     else if (finalQuantumArray[i].equals("'01'")) {
      pixels[i + bottom] = black;
    }
     else if (finalQuantumArray[i].equals("'10'")) {
      pixels[i] = white;
    }
  }
  updatePixels();
}
