int count = 0;
int numb = 2;
float x = 0;
boolean type = false;
float[] xarr = new float[numb];
float[] yarr = new float[numb];


void incenter(float x1, float y1, float x2, float y2, float x3, float y3)
{
  float ox, oy, r, a, b, c, p, P;
  a = sqrt(pow((x3 - x2), 2) + pow((y3 - y2), 2));
  b = sqrt(pow((x1 - x3), 2) + pow((y1 - y3), 2));
  c = sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2));
  P = (a + b + c);
  p = P/2;
  r = sqrt((p - a) * (p - b) * (p - c) / p);
  ox = (a * x1 + b * x2 + c * x3) / P;
  oy = (a * (y1) + b * (y2) + c * (y3)) / P;
  ellipse(ox, oy, 2 * r, 2 * r);
}
void circumcenter(float x1, float y1, float x2, float y2, float x3, float y3)
{
  float a, b, c, P, p, R, mid1x, mid1y, mid2x, mid2y, m1, m2, centerx, centery;
  mid1x = (x1 + x2) / 2;
  mid1y = (y1 + y2) / 2;
  m1 = (y2 - y1)/(x2 - x1);
  //float Y1 = ((-1)/ m1 ) * (x - mid1x) + mid1y;
  mid2x = (x2 + x3) / 2;
  mid2y = (y2 + y3) / 2;
  m2 = (y3 - y2) / (x3 - x2);
  //float Y2 = ((-1) / m2) * (x - mid2x) + mid2y;
  centerx = ( ( (mid2x / m2) - (mid1x / m1) + mid2y - mid1y) / ( (1 / m2) - (1 / m1) ) );
  centery = ((-1)/ m1 ) * (centerx - mid1x) + mid1y;
  a = sqrt(pow((x3 - x2), 2) + pow((y3 - y2), 2));
  b = sqrt(pow((x1 - x3), 2) + pow((y1 - y3), 2));
  c = sqrt(pow((x1 - x2), 2) + pow((y1 - y2), 2));
  P = (a + b + c);
  p = P/2;
  R = a * b * c / (4 * sqrt( (p - a) * (p - b) * (p - c) * p));
  ellipse(centerx, centery, 2 * R, 2 * R);
}
float f(float x)
{
  return 150 + sin(x) * 15;
}
void mousePressed()
{
  type = !type;
  if(count < numb)
  {
    xarr[count] = mouseX;
    yarr[count] = mouseY;
  }
  count++;
}

void setup()
{
  size(700, 700);
  frameRate(100);
  noFill();
}

void draw()
{
  
  background(#F5E31E);
  if(count >= numb)
  {
    if(type)
    {
      circumcenter(xarr[0], yarr[0], xarr[1], yarr[1], mouseX, mouseY);
      incenter(xarr[0], yarr[0], xarr[1], yarr[1], mouseX, mouseY);
     // triangle(xarr[0], yarr[0], xarr[1], yarr[1], mouseX, mouseY);
    }  
    else
    {
      if(x == width || f(x) == height || f(x) == 0) x = 0;
      circumcenter(xarr[0], yarr[0], xarr[1], yarr[1], x, f(x));
      incenter(xarr[0], yarr[0], xarr[1], yarr[1], x, f(x));
      //triangle(xarr[0], yarr[0], xarr[1], yarr[1], x, f(x));
      x += 0.4;
    }
  }
}