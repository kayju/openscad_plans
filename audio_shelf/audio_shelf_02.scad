/*
W: 149.5 cm = 58.85"
D: 60 cm = 23.622"
H: 70 cm = 27.56"
*/

Width = 57; // + 0.75 * 2
Depth = 20;
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

board(
    Width, Depth, Thick,
    1.0, 0.3, 0.3,
    0, 0, 0,
    0, 0, 0,
    0, DimensionY);

board(
    Width * 2 / 3, Depth, Thick,
    0.7, 0.8, 0.3,
    0, 0, 8,
    0, 0, 0,
    62, DimensionY);

board(
    Width * 2 / 3, Depth, Thick,
    0.7, 0.3, 0.7,
    Width - (Width * 2/ 3) + Thick, 0, 8 * 2,
    0, 0, 0,
    105, DimensionY);

board(
    Width / 2 , Depth, Thick,
    0.3, 0.1, 0.5,
    -Thick, 0, 8 * 3,
    0, 0, 0,
    150, DimensionY);

board(8 * 3, Depth, Thick,
    0.9, 0.8, 0.9,
    0, 0, 0,
    0, 270, 0,
    185, DimensionY);

board(8 * 2, Depth, Thick,
    0.7, 0.8, 1,
    Width + Thick, 0, 0,
    0, 270, 0,
    215, DimensionY);

board(8 - Thick, Depth, Thick,
    0.2, 0.3, 0.8,
    38, 0, Thick,
    0, 270, 0,
    235, DimensionY);

board(8 - Thick, Depth, Thick,
    0.7, 0.6, 0.6,
    20.5, 0, 8 + Thick * 1,
    0, 270, 0,
    250, DimensionY);

board(8 - Thick, Depth, Thick,
    0.3, 0.8, 0.9,
    27.75, 0, 8 * 2 + Thick * 1,
    0, 270, 0,
    265, DimensionY);
