include <../lib/common.scad>

//--------------------------------------------------------------------------------------------------
module bot_vert()
{
    color([1, 0, 0])
    cube([11, 12, 0.75]);
}

//--------------------------------------------------------------------------------------------------
module bot_hor()
{
    translate([11, 23, 0.75])
    {
        rotate([0, 0, 180])
        {
            color([0, 1, 0])
            prism(11, 11, 0.75);
        }
    }

    translate([0, 5.5, 0])
    {
        color([0, 1, 0])
        cube([11, 6.5, 0.75]);
    }

    translate([5.5, 0, 0])
    {
        color([0, 1, 0])
        cube([5.5, 5.5, 0.75]);
    }

    translate([5.5, 5.5, 0])
    {
        color([0, 1, 0])
        cylinder(0.75, 5.5, 5.5, false, $fn=100);
    }
}

//--------------------------------------------------------------------------------------------------
module bot_hor_l()
{
    translate([11, 34, 0.75])
    {
        rotate([0, 0, 180])
        {
            color([1, 1, 0])
            prism(11, 11, 0.75);
        }
    }

    translate([0, 5.5, 0])
    {
        color([1, 1, 0])
        cube([11, 17.5, 0.75]);
    }

    translate([5.5, 0, 0])
    {
        color([1, 1, 0])
        cube([5.5, 5.5, 0.75]);
    }

    translate([5.5, 5.5, 0])
    {
        color([1, 1, 0])
        cylinder(0.75, 5.5, 5.5, false, $fn=100);
    }
}

//--------------------------------------------------------------------------------------------------
module top_vert()
{
    color([0, 0, 1])
    cube([11, 11, 0.75]);
}

//--------------------------------------------------------------------------------------------------
module top_hor()
{
    color([0, 1, 1])
    cube([11, 5.5, 0.75]);

    translate([0, 5.5, 0])
    {
        color([0, 1, 1])
        cube([5.5, 5.5, 0.75]);
    }

    translate([5.5, 5.5, 0])
    {
        color([0, 1, 1])
        cylinder(0.75, 5.5, 5.5, false, $fn=100);
    }
}

//--------------------------------------------------------------------------------------------------
// Draw Parts
//--------------------------------------------------------------------------------------------------
translate([0, -50, 0])
{
    //----------------------------------------------------------------------------------------------
    // bot_hor
    //----------------------------------------------------------------------------------------------
    translate([0, 0, 0])
    {
        bot_hor();

        translate([0, 24, 0])
        {
            arrow_x(11);
        };

        translate([-3, 0, 0])
        {
            arrow_y(23);
        };

        translate([-1, 12, 0])
        {
            arrow_y(11);
        };
    };

    //----------------------------------------------------------------------------------------------
    // bot_hor_l
    //----------------------------------------------------------------------------------------------
    translate([17, 0, 0])
    {
        bot_hor_l();

        translate([0, 35, 0])
        {
            arrow_x(11);
        };

        translate([-3, 0, 0])
        {
            arrow_y(34);
        };

        translate([-1, 23, 0])
        {
            arrow_y(11);
        };
    };

    //----------------------------------------------------------------------------------------------
    // bot_vert
    //----------------------------------------------------------------------------------------------
    translate([32, 0, 0])
    {
        bot_vert();

        translate([0, 13, 0])
        {
            arrow_x(11);
        };

        translate([-1, 0, 0])
        {
            arrow_y(12);
        };
    };

    //----------------------------------------------------------------------------------------------
    // top_vert
    //----------------------------------------------------------------------------------------------
    translate([47, 0, 0])
    {
        top_vert();

        translate([0, 12, 0])
        {
            arrow_x(11);
        };

        translate([-1, 0, 0])
        {
            arrow_y(11);
        };
    }

    //----------------------------------------------------------------------------------------------
    // top_hor
    //----------------------------------------------------------------------------------------------
    translate([62, 0, 0])
    {
        top_hor();

        translate([0, 12, 0])
        {
            arrow_x(11);
        };

        translate([-1, 0, 0])
        {
            arrow_y(11);
        };
    }
};


//--------------------------------------------------------------------------------------------------
// Render
//--------------------------------------------------------------------------------------------------
module bot_hor_com()
{
    translate([11, 34, 0])
    {
        rotate([0, 0, 180])
        {
            bot_hor_l();
        }
    }

    translate([23, 11, 0.75])
    {
        rotate([0, 180, 90])
        {
            bot_hor();
        }
    }
}

translate([0, 0, 0])
{
    translate([0, 0, 0])
    {
        bot_hor_com();
    }

    translate([0, 0, 12.75])
    {
        bot_hor_com();
    }

    translate([0, 0, 25.5])
    {
        bot_hor_com();
    }

    translate([0, 0, 38.25])
    {
        bot_hor_com();
    }

    translate([16.75 , 0, 0.75])
    {
        rotate([90, 0, 90])
        {
            bot_vert();
        }
    }

    translate([16.75 , 0, 13.5])
    {
        rotate([90, 0, 90])
        {
            bot_vert();
        }
    }

    translate([16.75 , 0, 26.25])
    {
        rotate([90, 0, 90])
        {
            bot_vert();
        }
    }

    translate([0 , 0, 0.75])
    {
        rotate([90, 0, 90])
        {
            bot_vert();
        }
    }

    translate([0 , 0, 13.5])
    {
        rotate([90, 0, 90])
        {
            bot_vert();
        }
    }

    translate([0 , 0, 26.25])
    {
        rotate([90, 0, 90])
        {
            bot_vert();
        }
    }

    translate([0 , 27.75, 0.75])
    {
        rotate([90, 0, 0])
        {
            bot_vert();
        }
    }

    translate([0 , 27.75, 13.5])
    {
        rotate([90, 0, 0])
        {
            bot_vert();
        }
    }

    translate([0 , 27.75, 26.25])
    {
        rotate([90, 0, 0])
        {
            bot_vert();
        }
    }

    translate([0 , 0.75, 39])
    {
        rotate([90, 0, 0])
        {
            top_vert();
        }
    }

    translate([0 , 0, 50])
    {
        rotate([0, 0, 0])
        {
            top_hor();
        }
    }

    translate([0 , 0, 61.75])
    {
        rotate([0, 90, 0])
        {
            top_vert();
        }
    }

    translate([0 , 0, 61.75])
    {
        rotate([0, 0, 0])
        {
            top_hor();
        }
    }

    translate([0 , 0.75, 62.5])
    {
        rotate([90, 0, 0])
        {
            top_vert();
        }
    }

    translate([0 , 0, 73.5])
    {
        rotate([0, 0, 0])
        {
            top_hor();
        }
    }

    translate([0 , 0, 85.25])
    {
        rotate([0, 90, 0])
        {
            top_vert();
        }
    }
}