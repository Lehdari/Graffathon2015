/**

    Graffathon 2015
    FS_Life.glsl

    @version    0.1
    @author     Miika 'LehdaRi' Lehtim�ki
    @date       2015-04-18

**/


#version 330 core

in vec2 UV;

out vec4 color;

uniform sampler2D gameTexture;

const uint xSize = uint(32);
const uint ySize = uint(32);

const float xDis = 1.0/float(xSize);
const float yDis = 1.0/float(ySize);

void main() {
    int nnR = 0; int nnG = 0; int nnB = 0;
    color = round(vec4(texture(gameTexture, UV).xyz, 1.0f));

    for (int i=-1; i<2; ++i) {
        for (int j=-1; j<2; ++j) {
            if (i==0 && j==0)
                continue;
            vec4 pix = round(texture(gameTexture, UV+vec2(i*xDis, j*yDis)));
            if (pix.r == 1.0) nnR++;
            if (pix.g == 1.0) nnG++;
            if (pix.b == 1.0) nnB++;
        }
    }

    if (color.r == 1.0) {
        if (nnR < 2)
            color.r = 0.0;
        else if (nnR > 3)
            color.r = 0.0;
    }
    else {
        if (nnR == 3)
            color.r = 1.0;
    }

    if (color.g == 1.0) {
        if (nnG < 2)
            color.g = 0.0;
        else if (nnG > 3)
            color.g = 0.0;
    }
    else {
        if (nnG == 3)
            color.g = 1.0;
    }

    if (color.b == 1.0) {
        if (nnB < 2)
            color.b = 0.0;
        else if (nnB > 3)
            color.b = 0.0;
    }
    else {
        if (nnB == 3)
            color.b = 1.0;
    }
}


