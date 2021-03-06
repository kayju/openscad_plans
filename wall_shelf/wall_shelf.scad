include <../lib/common.scad>


//--------------------------------------------------------------------------------------------------
module board()
{
    color([0, 0, 1])
    cube([8, 24, 0.75]);
}

//--------------------------------------------------------------------------------------------------
// Render
//--------------------------------------------------------------------------------------------------
translate([0, 0, 0])
{
    //----------------------------------------------------------------------------------------------
    // board
    //----------------------------------------------------------------------------------------------
    translate([0, 0, 0])
    {
        rotate([0, 0, 0])
        {
            board();
        }
    };

    translate([0, 10, 10])
    {
        rotate([0, 0, 0])
        {
            board();
        }
    };

    translate([0, 0, 20])
    {
        rotate([0, 0, 0])
        {
            board();
        }
    };
}


//--------------------------------------------------------------------------------------------------
// Draw Parts
//--------------------------------------------------------------------------------------------------
translate([0, -40, 0])
{
    //----------------------------------------------------------------------------------------------
    // Top board
    translate([0, 0, 0])
    {
        back_board();

        translate([0, 19, 0])
        {
            arrow_x(14);
        };

        translate([-1, 0, 0])
        {
            arrow_y(18);
        };
    };
}
