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

// Bottom
board(
    18, 14, Thick,
    0.7, 0.7, 1.0,
    0, 0, 1,
    0, 0, 0,
    0, DimensionY);

board(
    18, 14, Thick,
    0.7, 0.7, 1.0,
    0, 0, 1 + Thick + 17,
    0, 0, 0,
    0, DimensionY);

board(
    18, 14, Thick,
    0.7, 0.7, 1.0,
    0, 0, 42.75 - Thick - 7 - 7 - 2,
    0, 0, 0,
    0, DimensionY);

board(
    18, 14, Thick,
    0.7, 0.7, 1.0,
    0, 0, 42.75 - Thick - 7 - 2,
    0, 0, 0,
    0, DimensionY);

// Top
board(
    18 + Thick * 2, 14 + 1, Thick,
    0.5, 0.2, 1.0,
    -Thick, -1, 42.75 - Thick,
    0, 0, 0,
    25, DimensionY);

// Side boards
board(
    14, 42.75 - Thick, Thick,
    0.7, 1.0, 1.0,
    -Thick, 0, 0,
    90, 0, 90,
    50, DimensionY);

board(
    14, 42.75 - Thick, Thick,
    0.7, 1.0, 1.0,
    -Thick + 18 + Thick, 0, 0,
    90, 0, 90,
    50, DimensionY);

board(
    14, 17, Thick,
    0.7, 1.0, 0.3,
    8, 0, 1 + Thick,
    90, 0, 90,
    70, DimensionY);

// Doors
board(
    10.75, 17 + Thick, Thick,
    0.7, 0.2, 0.3,
    8, 0, 1,
    90, 0, 0,
    90, DimensionY);

board(
    18 + Thick * 2, 7.75, Thick,
    0.7, 0.5, 0.5,
    -Thick, 0, 1 + 17 + Thick + 0.2,
    90, 0, 0,
    110, DimensionY);
