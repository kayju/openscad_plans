//--------------------------------------------------------------------------------------------------
// Module Prism
//--------------------------------------------------------------------------------------------------
module prism(z, y, x)
{
    rotate([0, 90, 0])
    {
        polyhedron(
                points=[[0,0,0], [x,0,0], [x,y,0], [0,y,0], [0,y,z], [x,y,z]],
                faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]);
    }
    
}

//--------------------------------------------------------------------------------------------------
// Module Side panel
//--------------------------------------------------------------------------------------------------
module rect_cut(x, y, z, dx, dy)
{
    // Top panel
    translate([0, dy, 0])
    {
        cube([x, y - dy, z]);
    };

    // Left bottom panel
    translate([0, 0, 0])
    {
        cube([dx, dy, z]);
    };

    // Triangle
    translate([dx, 0, 0])
    {
        rotate([0, 0, 0])
        {
            prism(x - dx, dy, -z);
        }
    };
}

//--------------------------------------------------------------------------------------------------
// X dimensional arrow
//--------------------------------------------------------------------------------------------------
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

//--------------------------------------------------------------------------------------------------
// Y dimensional arrow
//--------------------------------------------------------------------------------------------------
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