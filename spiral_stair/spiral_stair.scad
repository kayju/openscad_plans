include <../lib/common.scad>

PartY = 200;
StairHeight = 8.2;

//------------------------------------------------------------------------------
// Render
//------------------------------------------------------------------------------

// Post 0
translate([0, 0, 0])
{
    board(3.5, 3.5, 9.0 * 12, 0, 0, 0);
}
dimension(3.5, 3.5, 9.0 * 12, 0, 0, 0, 0, PartY);

// Post 1
translate([33.5, 00, 0])
{
    board(3.5, 3.5, 9 * 12, 0.5, 0.5, 0);
}
dimension(3.5, 3.5, 9 * 12, 0.5, 0.5, 0, 10, PartY);

// Post 2
translate([0, -56.5, 0])
{
    board(3.5, 3.5, 115, 0.5, 0.5, 0.5);
}
dimension(3.5, 3.5, 115, 0.5, 0.5, 0.5, 20, PartY);

// Post 3
translate([33.5, -56.5 + 30, 0])
{
    board(3.5, 3.5, 12 * 11, 1, 0, 0);
}
dimension(3.5, 3.5, 12 * 11, 1, 0, 0, 30, PartY);

// Post 4
translate([33.5 + 33.5, -56.5, 0])
{
    board(3.5, 3.5, 90.4, 0.7, 0.7, 0.7);
}
dimension(3.5, 3.5, 90.4, 0.7, 0.7, 0.7, 40, PartY);

// Post 5
translate([33.5 + 33.5, 0, 0])
{
    board(3.5, 3.5, 12 * 5 - 2, 1, 0.7, 0.7);
}
dimension(3.5, 3.5, 5 * 12, 1, 0.7, 0.7, 50, PartY);


translate([33.5, 2, 12 * 9])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}
dimension(3.5, 3.5, 4 * 12, 0.5, 0.7, 1, 60, PartY);


// stair board
// 1 -------------2
// |              |  
// 0 ------------ 3
//
// (x0, y0, x1, y1, x2, y2, x3, y3, z)
module stair_board(x0, y0, x1, y1, x2, y2, x3, y3, z)
{
    polyhedron(
        points=[[x0,y0,0], [x1,y1,0], [x2,y2,0], [x3,y3,0], [x0,y0,z], [x1,y1,z], [x2,y2,z], [x3,y3,z]],
        faces=[[0,1,2], [0,2,3],[0,4,3],[4,7,3],[0,1,5],[0,4,5],[1,2,6],[1,6,5],[2,3,7],[2,7,6],[4,5,6],[4,6,7]]);
}

module stair_dimension(w, d)
{
    translate([part_x, -part_y, 0])
    {
        translate([0, -2, 0])
        {
            color([0, 0, 0])
            arrow_x(w);
        };

        translate([-1, 0, 0])
        {
            color([0, 0, 0])
            arrow_y(d);
        };
    }
}

// Stair 1
translate([3.5, -10 + 3.5, 12 * 9 - 1.5 - StairHeight])
{
    rotate([0, 0, 0])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
}

// Stair dimension 1
translate([100, -200, 0])
{
    rotate([0, 0, 90])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
    
    translate([-10, 0, 0])
    {
        stair_dimension(10, 30);
    }
}

// Stair 2
translate([3.5, -10 + 3.5 - 10, 12 * 9 - 1.5 - StairHeight * 2])
{
    rotate([0, 0, 0])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
}

// Stair 3
translate([3.5, -10 + 3.5 - 10 * 2, 12 * 9 - 1.5 - StairHeight * 3])
{
    rotate([0, 0, 0])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
}

// Stair 4
translate([3.5, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 4])
{
    rotate([0, 0, 0])
    {
        color([0, 0.5, 0.8])
        stair_board(0, 15, 0, 30, 30, 30, 30, 26.5, 1.5);
    }
}


// Stair dimension 4
translate([133, -200, 0])
{
    rotate([0, 0, 90])
    {
        color([0, 0.5, 0.8])
        stair_board(0, 15, 0, 30, 30, 30, 30, 26.5, 1.5);
    }
    
    translate([-30, 0, 0])
    {
        stair_dimension(15, 30);
    }

    translate([-30, 31, 0])
    {
        arrow_x(3.5);
    }
}

// Stair 5
translate([3.5, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 5])
{
    rotate([0, 0, 0])
    {
        color([0, 0.5, 0.5])
        stair_board(0, 0, 0, 15, 30, 30, 30, 26.5, 1.5);
    }
}

// Stair dimension 5
translate([157, -200, 0])
{
    rotate([0, 0, 90])
    {
        color([0, 0.5, 0.5])
        stair_board(0, 0, 0, 15, 30, 30, 30, 26.5, 1.5);
    }
    
    translate([-30, 0, 0])
    {
        stair_dimension(15, 30);
    }

    translate([-30, 31, 0])
    {
        arrow_x(3.5);
    }

    translate([-15, -2, 0])
    {
        arrow_x(15);
    }
}

// Stair 6
translate([3.5, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 5])
{
    rotate([0, 0, 0])
    {
        color([0.4, 0.3, 0.3])
        stair_board(0, 0, 30, 26.5, 33.5, 26.5, 17, 0, 1.5);
    }
}

// Stair dimension 6
translate([163, -200, 0])
{
    rotate([0, 0, 0])
    {
        color([0.4, 0.3, 0.3])
        stair_board(0, 0, 30, 26.5, 33.5, 26.5, 17, 0, 1.5);
    }
    
    translate([0, 0, 0])
    {
        stair_dimension(17, 26.5);
    }

    translate([0, 27.5, 0])
    {
        arrow_x(30);
    }

    translate([30, 27.5, 0])
    {
        arrow_x(3.5);
    }

    translate([13.5, -2, 0])
    {
        arrow_x(20);
    }
}

// Stair 7
translate([3.5, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 6])
{
    rotate([0, 0, 0])
    {
        color([0.4, 0.7, 0.7])
        stair_board(17, 0, 30, 26.5, 33.5, 26.5, 33.5, 0, 1.5);
    }
}

// Stair dimension 7
translate([183, -200, 0])
{
    rotate([0, 0, 0])
    {
        color([0.4, 0.7, 0.7])
        stair_board(17, 0, 30, 26.5, 33.5, 26.5, 33.5, 0, 1.5);
    }
    
    translate([17, 0, 0])
    {
        stair_dimension(16.5, 26.5);
    }

    translate([17, 27.5, 0])
    {
        arrow_x(13);
    }

    translate([30, 27.5, 0])
    {
        arrow_x(3.5);
    }
}

// Stair 8
translate([3.5 + 30, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 7])
{
    rotate([0, 0, 0])
    {
        color([0.7, 0.3, 0.3])
        stair_board(0, 0, 0, 26.5, 3.5, 26.5, 16.5, 0, 1.5);
    }
}

// Stair dimension 8
translate([230, -200, 0])
{
    rotate([0, 0, 0])
    {
        color([0.7, 0.3, 0.3])
        stair_board(0, 0, 0, 26.5, 3.5, 26.5, 16.5, 0, 1.5);
    }
    
    translate([0, 0, 0])
    {
        stair_dimension(16.5, 26.5);
    }

    translate([0, 27.5, 0])
    {
        arrow_x(3.5);
    }
}

// Stair 9
translate([3.5 + 30, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 8])
{
    rotate([0, 0, 0])
    {
        color([0.9, 0.25, 0.25])
        stair_board(16.5, 0, 0, 26.5, 3.5, 26.5, 33.5, 0, 1.5);
    }
}

// Stair dimension 9
translate([260, -200, 0])
{
    rotate([0, 0, 0])
    {
        color([0.9, 0.25, 0.25])
        stair_board(16.5, 0, 0, 26.5, 3.5, 26.5, 33.5, 0, 1.5);
    }
    
    translate([0, 0, 0])
    {
        stair_dimension(16.5, 26.5);
    }

    translate([0, 27.5, 0])
    {
        arrow_x(3.5);
    }

    translate([3.5, 27.5, 0])
    {
        arrow_x(30);
    }

    translate([16.5, -2, 0])
    {
        arrow_x(17);
    }
}

// Stair 10
translate([3.5 + 30 + 3.5, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 8])
{
    rotate([0, 0, 0])
    {
        color([0.1, 0.6, 0])
        stair_board(0, 26.5, 0, 30, 30, 15, 30, 0, 1.5);
    }
}

// Stair dimension 10
translate([300, -200, 0])
{
    rotate([0, 0, 0])
    {
        color([0.1, 0.6, 0])
        stair_board(0, 26.5, 0, 30, 30, 15, 30, 0, 1.5);
    }
    
    translate([0, 0, 0])
    {
        stair_dimension(30, 26.5);
    }

    translate([-1, 26.5, 0])
    {
        arrow_y(3.5);
    }

    translate([31.5, 0, 0])
    {
        arrow_y(15);
    }

    translate([31.5, 15, 0])
    {
        arrow_y(15);
    }
}

// Stair 11
translate([3.5 + 30 + 3.5, -56.5 + 3.5, 12 * 9 - 1.5 - StairHeight * 9])
{
    rotate([0, 0, 0])
    {
        color([0.1, 0.2, 0.4])
        stair_board(0, 26.5, 0, 30, 30, 30, 30, 15, 1.5);
    }
}


// Stair dimension 10
translate([340, -200, 0])
{
    rotate([0, 0, 0])
    {
        color([0.1, 0.2, 0.4])
        stair_board(0, 26.5, 0, 30, 30, 30, 30, 15, 1.5);
    }
    
    translate([0, 15, 0])
    {
        stair_dimension(30, 11.5);
    }

    translate([-1, 26.5, 0])
    {
        arrow_y(3.5);
    }

    translate([31.5, 15, 0])
    {
        arrow_y(15);
    }
}

// Stair 12
translate([3.5 + 30 + 3.5, -10 + 3.5 - 10 * 2, 12 * 9 - 1.5 - StairHeight * 10])
{
    rotate([0, 0, 0])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
}

// Stair 13
translate([3.5 + 30 + 3.5, -10 + 3.5 - 10 * 2 + 10, 12 * 9 - 1.5 - StairHeight * 11])
{
    rotate([0, 0, 0])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
}

// Stair 14
translate([3.5 + 30 + 3.5, -10 + 3.5, 12 * 9 - 1.5 - StairHeight * 12])
{
    rotate([0, 0, 0])
    {
        color([0, 1, 1])
        stair_board(0, 0, 0, 10, 30, 10, 30, 0, 1.5);
    }
}

translate([66, -6, 0])
{
    arrow_z(8.1);
}

translate([66, -6, 8.1 + 1.5])
{
    arrow_z(8.2);
}

translate([33.5, 0, 0])
{
    rotate([90, 180, 0])
    {
        arrow_x(30);
    }
}

translate([66, -40, 0])
{
    arrow_z(42.4);
}

translate([63, -60, 0])
{
    rotate([0, 0, -90])
    {
        arrow_z(42.4);
    }
}

translate([18, -56, 0])
{
    rotate([0, 0, -90])
    {
        arrow_z(67);
    }
}

translate([3.5, -60, 0])
{
    rotate([0, 0, 0])
    {
        arrow_x(63.5);
    }
}

translate([67, 0, 0])
{
    rotate([90, 180, 0])
    {
        arrow_x(30);
    }
}

translate([0, 0, 0])
{
    rotate([0, 90, 180])
    {
        arrow_y(56.5 - 3.5);
    }
}

translate([33.5, 0, 0])
{
    rotate([0, 90, 180])
    {
        arrow_y(30 - 7);
    }
}

// Guides
translate([67, -63, 48])
{
    rotate([90, 35, 90])
    {
        color([0, 0, 1])
        stair_board(10, 0, 0, 11.5, 70, 11.5, 80, 0, 1.5);
    }
}

translate([35.5, -24, 19])
{
    rotate([90, 35, 90])
    {
        color([0, 0, 1])
        stair_board(0, 0, -8, 11.5, 23, 11.5, 31, 0, 1.5);
    }
}

translate([-3, -53, 63.8])
{
    rotate([90, 23, 0])
    {
        color([0, 0, 1])
        stair_board(5, 0, 0, 11.5, 72, 11.5, 77, 0, 1.5);
    }
}

translate([3.5, 10, 97.25])
{
    rotate([90, 34, -90])
    {
        color([0, 0, 1])
        stair_board(10, 0, 0, 11.5, 72, 11.5, 77, 0, 1.5);
    }
}

translate([35.5, 0, 92])
{
    rotate([90, 35, -90])
    {
        color([0, 0, 1])
        stair_board(0, 0, -8, 11.5, 23, 11.5, 31, 0, 1.5);
    }
}

// Rails
translate([35.5, -26, 69])
{
    rotate([90, 31, 90])
    {
        color([1, 0, 1])
        stair_board(3, 0, 0, 3.5, 29, 3.5, 32, 0, 1.5);
    }
}

translate([67, -56, 87])
{
    rotate([90, 31, 90])
    {
        color([1, 0, 1])
        stair_board(3, 0, 0, 3.5, 64, 3.5, 67, 0, 1.5);
    }
}

translate([2, -53, 111])
{
    rotate([90, 21, 0])
    {
        color([1, 0, 1])
        stair_board(1, 0, 0, 3.5, 70, 3.5, 72, 0, 1.5);
    }
}

translate([35, 7, 153])
{
    rotate([90, 42, -90])
    {
        color([0, 0, 1])
        stair_board(2, 0, 0, 4, 38, 4, 41, 0, 1.5);
    }
}


// deck
translate([0, 0, 12 * 9])
{
    color([1, 1, 0])
    board(12 * 12, 12 * 19
    , 1.5, 1, 0, 0);
}

// Deck Post
translate([2, 12 * 19 - 3.5 - 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 4 - 3.5 - 2, 12 * 19 - 3.5 - 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 8 - 3.5 - 2, 12 * 19 - 3.5 - 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 12 * 19 - 3.5 - 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 12 * 15.5, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 12 * 12.5, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 12 * 9.5, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 12 * 6.5, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 12 * 3.25, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 12 - 3.5 - 2, 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 9 - 3.5 - 2, 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

translate([12 * 6 - 3.5 - 2, 2, 12 * 9 + 1.5])
{
    board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
}

// Deck Rails
translate([12 * 12 - 3.5 - 2, 2, 12 * 13])
{
    color([1, 0.6, 0.2])
    board(3.5, 12 * 18 + 8, 1.5, 1, 0, 0);
}

translate([2, 12 * 19 - 2, 12 * 13])
{
    rotate([0, 0, -90])
    {
        color([1, 0, 1])
        board(3.5, 12 * 11 + 8, 1.5, 1, 0, 0);
    }
}

translate([33.5, 3.5 + 2, 12 * 13])
{
    rotate([0, 0, -90])
    {
        color([1, 0, 1])
        board(3.5, 12 * 9 + 0.5 , 1.5, 1, 0, 0);
    }
}

/*
Wire:
12 ft * 10 * 2 = 240 ft
19Ft * 10 = 190 ft
450 ft
76 + 63 = 139 = 150ft

* Wire 600 ft : $45.99 (400ft) X 2 = $92
https://www.amazon.com/gp/product/B08DFPK92T/ref=ox_sc_act_title_1?smid=AWBF18OIWWCF7&psc=1

* End(CR23) : 40
4" : $35.99 (40) 
https://www.amazon.com/Muzata-Threaded-Terminal-Fitting-Stainless/dp/B07X69BWBY/ref=sr_1_17?dchild=1&keywords=Muzata%2BCR30&qid=1607473682&sr=8-17&th=1

6" : $19.99 (10)
https://www.amazon.com/Threaded-Tension-Terminal-Stainless-CR39/dp/B07RDHNWG6/ref=sr_1_9?dchild=1&keywords=Muzata+CR30&qid=1607473583&sr=8-9

* Dead End(CR24) : 40
$34.99 X 2 (40) = $69.98
https://www.amazon.com/Muzata-Stainless-handcrimp-Stemball-Railing/dp/B078H4W8GZ/ref=sr_1_1_sspa?dchild=1&keywords=Muzata+CR24&qid=1605090029&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExSklSR1Y1OVFGRVZYJmVuY3J5cHRlZElkPUEwODc3NzgxMU9QUVBDM0pGTkFHOCZlbmNyeXB0ZWRBZElkPUEwODIwNjU1M0JIOU5GTkFTRUpZUSZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=

* Corner 45 Degree: 40 : $45.99
https://www.amazon.com/CKE-Stainless-Beveled-Protector-Sleeves/dp/B08DTV1FC1/ref=sr_1_4_sspa?dchild=1&keywords=CKE&qid=1605088202&sr=8-4-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFLQzJWSlpKNlk0TkgmZW5jcnlwdGVkSWQ9QTAwNjQ4NjEzN1lOVUJORE5LSTNIJmVuY3J5cHRlZEFkSWQ9QTAwNDI3NjEyN0dHWk5GMU1PNUNGJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==

* Protector Sleeves: 220

$39.99 X 2 = $79.98 : 200
https://www.amazon.com/Muzata-Stainless-Protective-Balustrade-CR13/dp/B07426BBKH?ref_=ast_sto_dp

$17.99 : 40
https://www.amazon.com/Muzata-Stainless-Protective-Balustrade-CK16/dp/B07JN2D5KV?ref_=ast_sto_dp

* 30 Degree Angled Beveled Washer : 40
$45.99 : 50
https://www.amazon.com/Professional-Stainless-Balustrade-Railings-Aluminum/dp/B082YQYHQB/ref=sr_1_13_sspa?dchild=1&keywords=Angle+Beveled+Washer+for+1%2F8%22&qid=1607475095&s=hi&sr=1-13-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExVlo0N1A5SkdBTTJHJmVuY3J5cHRlZElkPUEwNzM4MDkxMTNBOExKMElPSURJSSZlbmNyeXB0ZWRBZElkPUEwMTA2NTk2M0s4SVlSU0M1U1Q2OSZ3aWRnZXROYW1lPXNwX210ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=

* Tool
Hydraulic Cable Crimper: $56.98
https://www.amazon.com/Goplus-Hydraulic-Crimper-Terminal-Crimping/dp/B00ZA2P3XM/ref=sr_1_7?dchild=1&keywords=Hydraulic+Cable+Crimper&qid=1607475871&s=hi&sr=1-7

Drill guide: 
30 & 45 : 29.99 X 2 = $59.98
https://www.amazon.com/Muzata-Installation-Horizontal-Drilling-Template/dp/B083Q8K2N5/ref=sr_1_4?dchild=1&keywords=30%2Bdegree%2Bdrill%2Bguide&qid=1607476940&s=hi&sr=1-4&th=1


*/