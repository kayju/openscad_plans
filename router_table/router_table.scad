include <../lib/common.scad>

/*
Top: 30 X 24 
*/
// Top
translate([0, 0, 24])
{
    board(24, 30, 0.75, 0, 1, 0);
}
dimension(24, 0.75, 30, 0, 1, 0, 0, 50);

// Legs
translate([0, 2, 0])
{
    board(1.5, 3.5, 24, 1, 0, 0);
}
dimension(3.5, 1.5, 24, 1, 0, 0, 30, 50);

translate([22.5, 2, 0])
{
    board(1.5, 3.5, 24, 1, 0, 0);
}

translate([0, 24.5, 0])
{
    board(1.5, 3.5, 24, 1, 0, 0);
}

translate([22.5, 24.5, 0])
{
    board(1.5, 3.5, 24, 1, 0, 0);
}

// Blue
translate([1.5, 3.5, 12])
{
    rotate([-90, 0, 0])
    {
        board(1.5, 3.5, 23, 0, 0, 1);
    }
}
dimension(3.5, 1.5, 23, 0, 0, 1, 40, 50);

translate([21, 3.5, 12])
{
    rotate([-90, 0, 0])
    {
        board(1.5, 3.5, 23, 0, 0, 1);
    }
}

translate([1.5, 3.5, 24])
{
    rotate([-90, 0, 0])
    {
        board(1.5, 3.5, 23, 0, 0, 1);
    }
}

translate([21, 3.5, 24])
{
    rotate([-90, 0, 0])
    {
        board(1.5, 3.5, 23, 0, 0, 1);
    }
}

// Purple
translate([1.5, 2, 8.5])
{
    rotate([90, 0, 90])
    {
        board(1.5, 3.5, 21, 1, 0, 1);
    }
}
dimension(3.5, 1.5, 21, 1, 0, 1, 50, 50);

translate([1.5, 26.5, 8.5])
{
    rotate([90, 0, 90])
    {
        board(1.5, 3.5, 21, 1, 0, 1);
    }
}

translate([1.5, 2, 20.5])
{
    rotate([90, 0, 90])
    {
        board(1.5, 3.5, 21, 1, 0, 1);
    }
}

translate([1.5, 26.5, 20.5])
{
    rotate([90, 0, 90])
    {
        board(1.5, 3.5, 21, 1, 0, 1);
    }
}

// Fence
translate([1, -2, 24.75])
{
    rotate([0, 0, 0])
    {
        board(3.25, 34, 0.75, 0, 0.7, 0.7);
    }
}
dimension(3.25, 0.75, 34, 0, 0.7, 0.7, 60, 50);

translate([5, -2, 24.75])
{
    rotate([0, -90, 0])
    {
        board(4, 34, 0.75, 0.6, 1, 0);
    }
}
dimension(4, 0.75, 34, 0.6, 1, 0, 70, 50);

// Triangles
translate([4.25, 0, 28.75])
{
    rotate([-90, 0, 180])
    {
        color([1, 0.4, 0.9])
        prism(3.25, 3.25, 0.75);
    }
}
color([1, 0.4, 0.9])
translate([80, -50, 0])
{
    prism(3.25, 3.25, 0.75);
    translate([0, -2, 0])
    {
        color([0, 0, 0])
        arrow_x(3.25);
    }
    
    translate([-1, 0, 0])
    {
        color([0, 0, 0])
        arrow_y(3.25);
    }
}

translate([4.25, 10, 28.75])
{
    rotate([-90, 0, 180])
    {
        color([1, 0.4, 0.9])
        prism(3.25, 3.25, 0.75);
    }
}


translate([4.25, 20, 28.75])
{
    rotate([-90, 0, 180])
    {
        color([1, 0.4, 0.9])
        prism(3.25, 3.25, 0.75);
    }
}

translate([4.25, 29.25, 28.75])
{
    rotate([-90, 0, 180])
    {
        color([1, 0.4, 0.9])
        prism(3.25, 3.25, 0.75);
    }
}

// Clamp
translate([0, 0, 22.75])
{
    rotate([90, 0, 90])
    {
        board(2, 1.25, 24, 0, 0, 0);
    }
}
dimension(2, 1.25, 24, 0, 0, 0, 90, 50);

translate([0, 28, 22.75])
{
    rotate([90, 0, 90])
    {
        board(2, 1.25, 24, 0, 0, 0);
    }
}

translate([1, -2, 22.75])
{
    rotate([90, 0, 90])
    {
        board(2, 2, 4, 0.4, 0.7, 0.3);
    }
}
dimension(2, 2, 4, 0.4, 0.7, 0.3, 100, 50);

translate([1, 30, 22.75])
{
    rotate([90, 0, 90])
    {
        board(2, 2, 4, 0.4, 0.7, 0.3);
    }
}