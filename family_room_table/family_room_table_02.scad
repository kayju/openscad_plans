/*
29 X 56
11.25 X 2 X 6ft = 22.5 : $34.5 X 2 = $69

Poplar: 1 X 10 ft 
Pine:   1 X 10 ft
*/

include <../lib/common.scad>

// Top
// 56.25 X 2 = 112.5
// 1 X 10 ft
translate([0, 0, 0.75])
{
    board(11.25, 56.25, 0.75, 0, 1, 0);
}
dimension(11.25, 0.75, 56.25, 0, 1, 0, 0, 70);

translate([11.25, 0, 0.75])
{
    board(11.25, 56.25, 0.75, 0, 1, 0);
}

// Bottom
// 22.5 X 5 = 122.5
// 1 X 10 ft pine board
translate([5.625, 0, 0])
{
    board(11.25, 56.25, 0.75, 1, 0, 0);
}
dimension(11.25, 0.75, 56.25, 1, 0, 0, 15, 70);

translate([0, 0, 0])
{
    board(5.625, 56.25, 0.75, 0, 0, 1);
}
dimension(5.625, 0.75, 56.25, 0, 0, 1, 30, 70);

translate([16.875, 0, 0])
{
    board(5.625, 56.25, 0.75, 0, 0, 1);
}