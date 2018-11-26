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

//--------------------------------------------------------------------------------------------------
// parallelogram
//--------------------------------------------------------------------------------------------------
module parallelogram(x = 12, y = 12, z = 1, xd = 0)
{
    points = [
        [0, 0, 0 ],        //0
        [x, 0, 0 ],        //1
        [x + xd, y, 0],    //2
        [xd, y, 0 ],       //3
        [0, 0, z ],        //4
        [x, 0, z ],        //5
        [x + xd, y, z ],   //6
        [xd, y, z ]];      //7

    faces = [
        [0,1,2,3],         // bottom
        [4,5,1,0],         // front
        [7,6,5,4],         // top
        [5,6,2,1],         // right
        [6,7,3,2],         // back
        [7,4,0,3]];        // left

    polyhedron(points, faces);
}