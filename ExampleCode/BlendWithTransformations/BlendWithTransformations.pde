// [url=http://processing.org/discourse/yabb2/YaBB.pl?num=1271308799]mirroring image using blend()[/url]

PFont fontMenu, fontHelp;

int IMAGE_W = 500;
int IMAGE_H = 500;
int CHOICE_T = 40;
int CHOICE_L = 50;
int CHOICE_W = 200;
int CHOICE_SPACING = 25;
PGraphics baseImage;
PGraphics resultImage;
int lineNb = 50;
int lengthIncrement = 7;
boolean bDoBlend;

BlendMode currentBlendMode;
class BlendMode
{
  int blendMode;
  String blendName;
  BlendMode(int bm, String bn) { blendMode = bm; blendName = bn; }
  String toString() { return blendName; }
}
ArrayList<BlendMode> blendModes = new ArrayList<BlendMode>();

void setup()
{
  size(700, 500);
  smooth();
//  noLoop();
  fontHelp = createFont("Tahoma", 12);
  fontMenu = createFont("Tahoma Bold", 14);

  blendModes.add(new BlendMode(REPLACE, "REPLACE"));
  blendModes.add(new BlendMode(BLEND, "BLEND"));
  blendModes.add(new BlendMode(ADD, "ADD"));
  blendModes.add(new BlendMode(SUBTRACT, "SUBTRACT"));
  blendModes.add(new BlendMode(LIGHTEST, "LIGHTEST"));
  blendModes.add(new BlendMode(DARKEST, "DARKEST"));
  blendModes.add(new BlendMode(DIFFERENCE, "DIFFERENCE"));
  blendModes.add(new BlendMode(EXCLUSION, "EXCLUSION"));
  blendModes.add(new BlendMode(MULTIPLY, "MULTIPLY"));
  blendModes.add(new BlendMode(SCREEN, "SCREEN"));
  blendModes.add(new BlendMode(OVERLAY, "OVERLAY"));
  blendModes.add(new BlendMode(HARD_LIGHT, "HARD_LIGHT"));
  blendModes.add(new BlendMode(SOFT_LIGHT, "SOFT_LIGHT"));
  blendModes.add(new BlendMode(DODGE, "DODGE"));
  blendModes.add(new BlendMode(BURN, "BURN"));

  currentBlendMode = blendModes.get(0);

  baseImage = createGraphics(IMAGE_W, IMAGE_H, JAVA2D);
  DrawImage();
  resultImage = createGraphics(IMAGE_W, IMAGE_H, JAVA2D);
  resultImage.beginDraw();
  resultImage.image(baseImage, 0, 0);
  resultImage.endDraw();
}

void draw()
{
  background(#99EEFF);
  ShowBlendChoices();
  image(resultImage, CHOICE_W, 0);
}

// Choosing the operation to do
// Will add choice of blend mode...
void keyPressed()
{
  // Update base image with current screen
  baseImage.beginDraw();
  baseImage.copy(g, CHOICE_W, 0, IMAGE_W, IMAGE_H, 0, 0, IMAGE_W, IMAGE_H);
  baseImage.endDraw();

  switch (key)
  {
  case 'b':
    bDoBlend = !bDoBlend;
    println("Blend? " + bDoBlend);
    break;
  case 'i':
    if (bDoBlend)
    {
      BlendInverted();
    }
    else
    {
      DrawInverted();
    }
    break;
  case 'r':
    if (bDoBlend)
    {
      BlendReflected();
    }
    else
    {
      DrawReflected();
    }
    break;
  case 's':
    if (bDoBlend)
    {
      BlendShifted();
    }
    else
    {
      DrawShifted();
    }
    break;
  case 't':
    if (bDoBlend)
    {
      BlendRotated();
    }
    else
    {
      DrawRotated();
    }
    break;
  case 'c': // clear
    DrawImage();
    resultImage.beginDraw();
    resultImage.image(baseImage, 0, 0);
    resultImage.endDraw();
    break;
  }
  redraw();
}

// Try to make an interesting base image
// Square spiral, slightly improved from yet another old sketch
void DrawImage()
{
  baseImage.beginDraw();
  baseImage.colorMode(HSB, 1000);
  baseImage.fill(#DDEEFF);
  baseImage.rect(0, 0, IMAGE_W, IMAGE_H);
  baseImage.strokeWeight(7);
//  stroke(#005080);
  int cH = 200, cS = 1000, cB = 500;
  int lineLength = 5;
  int x, y;
  int px, py;
  px = x = baseImage.width / 2;
  py = y = baseImage.height / 2;

  for (int i = 0; i < lineNb; i++)
  {
    switch (i % 4)
    {
    case 0:
      x -= lineLength;
      break;
    case 1:
      y -= lineLength;
      break;
    case 2:
      x += lineLength;
      break;
    case 3:
      y += lineLength;
      break;
    }
    baseImage.stroke(cH, cS, cB);
    cH += 1000 / lineNb;
    cS -= 1000 / lineNb;
    cB += 10;
    baseImage.line(px, py, x, y);
    px = x; py = y;
    lineLength += lengthIncrement;
  }
  baseImage.endDraw();
}

void DrawInverted()
{
  println("DrawInverted");
  resultImage.beginDraw();
  resultImage.translate(baseImage.width, baseImage.height);
  resultImage.rotate(PI);
  resultImage.image(baseImage, 0, 0);
  resultImage.endDraw();
}

void DrawReflected()
{
  println("DrawReflected");
  resultImage.beginDraw();
  resultImage.translate(0, baseImage.height);
  resultImage.scale(1.00, -1.00);
  resultImage.image(baseImage, 0, 0);
  resultImage.endDraw();
}

void DrawShifted()
{
  println("DrawShifted");
  float SCALE = 1.2;
  float ns = baseImage.width * (SCALE - 1) / 2;
  resultImage.beginDraw();
  resultImage.translate(-ns, -ns);
  resultImage.scale(SCALE, SCALE);
  resultImage.image(baseImage, 0, 0);
  resultImage.endDraw();
}

void DrawRotated()
{
  println("DrawRotated");
  float ns = resultImage.width;
  resultImage.beginDraw();
  resultImage.translate(ns, ns);
  resultImage.rotate(PI / 36);
  resultImage.translate(-ns, -ns);
  resultImage.image(baseImage, 0, 0);
  resultImage.endDraw();
}

void Blend()
{
  println(currentBlendMode);
  blend(resultImage, 0, 0, resultImage.width, resultImage.height,
      CHOICE_W, 0, resultImage.width, resultImage.height,
      currentBlendMode.blendMode);
  resultImage.beginDraw();
  resultImage.copy(g, CHOICE_W, 0, IMAGE_W, IMAGE_H, 0, 0, IMAGE_W, IMAGE_H);
  resultImage.endDraw();
}

void BlendInverted()
{
  println("BlendInverted");
  DrawInverted();
  Blend();
}

void BlendReflected()
{
  println("BlendReflected");
  DrawReflected();
  Blend();
}

void BlendShifted()
{
  println("BlendShifted");
  DrawShifted();
  Blend();
}

void BlendRotated()
{
  println("BlendRotated");
  DrawRotated();
  Blend();
}

void ShowBlendChoices()
{
  int posY = CHOICE_T;
  textFont(fontMenu);
  for (BlendMode blendMode : blendModes)
  {
    if (IsMouseOverChoice(posY))
    {
      fill(#C05080);
      currentBlendMode = blendMode;
    }
    else
    {
      fill(#005080);
    }
    text(blendMode.blendName, CHOICE_L, posY);
    posY += CHOICE_SPACING;
  }
  textFont(fontHelp);
  String help = "b=activate blend; c=clear;\nDraw:\n  i=inverted;\n  r=reflected;\n  s=shifted;\n  t=rotated";
  text(help, CHOICE_L / 2, posY);
}

boolean IsMouseOverChoice(int posY)
{
  if (mouseX < CHOICE_L - 20 ||
      mouseX > CHOICE_W - 20)
    return false;
  if (mouseY < CHOICE_T - CHOICE_SPACING ||
      mouseY > CHOICE_T + CHOICE_SPACING * blendModes.size())
    return false;
  if (mouseY < posY - CHOICE_SPACING ||
      mouseY > posY)
    return false;
  return true;
}
