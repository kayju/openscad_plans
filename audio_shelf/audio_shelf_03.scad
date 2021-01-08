/*
W: 149.5 cm = 58.85"
D: 60 cm = 23.622"
H: 70 cm = 27.56"
*/

Width = 59.25; // + 0.75 * 2
Depth = 23;
Thick = 0.75;

//--------------------------------------------------------------------------------------------------
// Common moudles
//--------------------------------------------------------------------------------------------------

// X dimensional arrow
module arrow_x(l)
{
    line_w = 0.1;
    arrow_w = 1;
    arrow_h = 0.3;

    // Line
    translate([l / 2, 0, 0])
    {
        rotate([0, 90, 0])
        {
            color([0.4, 0.4, 0.4])
            cylinder(l - arrow_w * 2, line_w, line_w, true);
        }
    }

    // Left arrow
    translate([arrow_w, 0, 0])
    {
        rotate([0, 270, 0])
        {
            color([0.4, 0.4, 0.4])
            cylinder(arrow_w, arrow_h, 0, false);
        }
    }

    // Right arrow
    translate([l - arrow_w, 0, 0])
    {
        rotate([0, 90, 0])
        {
            color([0.4, 0.4, 0.4])
            cylinder(arrow_w, arrow_h, 0, false);
        }
    }

    // Text
    translate([l/3, 0.5, 0])
    {
        color([0.4, 0.4, 0.4])
        text(str(l), size=1);
    }
}

// Y dimensional arrow
module arrow_y(l)
{
    line_w = 0.1;
    arrow_w = 1;
    arrow_h = 0.3;

    // Line
    translate([0, l / 2, 0])
    {
        rotate([90, 0, 00])
        {
            color([0.4, 0.4, 0.4])
            cylinder(l - arrow_w * 2, line_w, line_w, true);
        }
    }

    // Left arrow
    translate([0 ,arrow_w, 0])
    {
        rotate([90, 0, 0])
        {
            color([0.4, 0.4, 0.4])
            cylinder(arrow_w, arrow_h, 0, false);
        }
    }

    // Right arrow
    translate([0, l - arrow_w, 0])
    {
        rotate([270, 0, 0])
        {
            color([0.4, 0.4, 0.4])
            cylinder(arrow_w, arrow_h, 0, false);
        }
    }

    // Text
    translate([-0.5, l/3, 0])
    {
        rotate([0 ,0, 90])
        {
            color([0.4, 0.4, 0.4])
            text(str(l), size=1);
        }
    }
}

module dimension(x, y, z, r, g, b, dx, dy = 50)
{
    
    translate([dx, -dy, 0])
    {
        color([r, g, b])
        cube([x, y, z]);

        translate([-2, 0, 0])
        {
            arrow_y(y);
        }

        translate([0, -2, 0])
        {
            arrow_x(x);
        }
    }
}

DimensionY = 50;

module board(x, y, z, r, g, b, posX, posY, posZ, rotX, rotY, rotZ, dimX, dimY = DimensionY)
{
    translate([posX, posY, posZ])
    {
        rotate([rotX, rotY, rotZ])
        {
            color([r, g, b])
            cube([x, y, z]);
        }
    }

    dimension(x, y, z, r, g, b, dimX, dimY);
}

//------------------------------------------------------------------------------
// Draw parts
//------------------------------------------------------------------------------
// Horizontal 01
board(
    Width, Depth, Thick,
    0.7, 0.3, 0.3,
    0, 0, 0,
    0, 0, 0,
    0, DimensionY);

// Horizontal 02
board(
    40.25, Depth, Thick,
    0.7, 0.7, 0.1,
    0, 0, 9 + Thick,
    0, 0, 0,
    65, DimensionY);

// Horizontal 03
board(
    19, Depth - 0.75, Thick,
    0.2, 0.6, 0.1,
    Thick, 0.75, 5.5 + Thick,
    0, 0, 0,
    110, DimensionY);

// Vertical 01
board(9, Depth - 0.75, Thick,
    0.9, 0.8, 0.9,
    Thick, 0.75, Thick,
    0, 270, 0,
    135, DimensionY);

// Vertical 02
board(9, Depth - 0.75, Thick,
    0.9, 0.8, 0.9,
    Thick + 19 + Thick, 0.75, Thick,
    0, 270, 0,
    135, DimensionY);

// Vertical 03
board(9, Depth - 0.75, Thick,
    0.9, 0.8, 0.9,
    Thick + 19 + Thick + 19 + Thick, 0.75, Thick,
    0, 270, 0,
    135, DimensionY);


/*
59.25 + 40.25 + 19 + 9 = 127.5
255
96 * 3

*/
