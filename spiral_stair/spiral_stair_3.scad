include <../lib/common.scad>

PartY = 200;
StairHeight = 8.2;
StairWidth = 30;
Thick = 1.5;
PoleThick = 3.5;


//------------------------------------------------------------------------------
// Render
//------------------------------------------------------------------------------

// Post 1
translate([-PoleThick / 2, -PoleThick / 2, 0])
{
    board(PoleThick, PoleThick, 9 * 12, 0.5, 0.5, 0);
}
dimension(PoleThick, PoleThick, 9 * 12, 0.5, 0.5, 0, 10, PartY);

translate([StairWidth + 3.5 / 2, 20 - 3.5 / 2, 0])
{
    board(PoleThick, PoleThick, 9 * 12, 0.5, 0.5, 0);
}

translate([StairWidth + 3.5 / 2, -StairWidth - PoleThick - PoleThick / 2, 0])
{
    board(PoleThick, PoleThick, 12 * 12, 0.5, 0.5, 0);
}

translate([-StairWidth - 3.5 - 3.5 / 2, -StairWidth - PoleThick - PoleThick / 2, 0])
{
    board(PoleThick, PoleThick, 9 * 12, 0.5, 0.5, 0);
}

translate([-StairWidth - 3.5 - 3.5 / 2, 20 - 3.5 / 2, 0])
{
    board(PoleThick, PoleThick, 9 * 12, 0.5, 0.5, 0);
}

translate([-3.5 / 2, 20 - 3.5 / 2, 0])
{
    board(PoleThick, PoleThick, 9 * 12, 0.5, 0.5, 0);
}

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

module Stair00()
{
    color([0, 1, 0.4])
    stair_board(0, 0, 0, 10, StairWidth + Thick * 2, 10, StairWidth + Thick * 2, 0, 1.5);
}

module Stair01()
{
    color([1, 0, 0])
    stair_board(PoleThick / 2, -PoleThick / 2, PoleThick / 2, PoleThick / 2, StairWidth + PoleThick / 2 + Thick, PoleThick / 2 + 15, StairWidth + PoleThick / 2 + Thick, 0, 1.5);
}

module Stair02()
{
    color([0, 0.4, 0.9])
    stair_board(PoleThick / 2, -PoleThick / 2, PoleThick / 2, PoleThick / 2, StairWidth + PoleThick / 2 + Thick, PoleThick / 2 + 30 + Thick, StairWidth + PoleThick / 2 + Thick, 15 + PoleThick / 2, 1.5);
}

module Stair03()
{
    color([0, 0.4, 0.4])
    stair_board(PoleThick / 2, 15 - PoleThick / 2, PoleThick / 2, 15 + PoleThick / 2, StairWidth  + PoleThick / 2 + Thick, 15 + PoleThick / 2, StairWidth + PoleThick / 2 + Thick, -PoleThick / 2, 1.5);
}

// Stair 0-1
translate([-StairWidth - 3.5 / 2 - Thick, 10 -3.5 / 2, 12 * 9 - Thick - StairHeight])
{
    rotate([0, 0, 0])
    {
        Stair00();
    }
}

// Stair 0-2
translate([-StairWidth - 3.5 / 2 - Thick, -3.5 / 2, 12 * 9 - Thick - StairHeight * 2])
{
    rotate([0, 0, 0])
    {
        Stair00();
    }
}

// Stair 1
translate([0, 0, 12 * 9 - Thick - StairHeight * 3])
{
    rotate([0, 0, -180])
    {
        Stair01();
    }
}

// Stair 2
translate([0, 0, 12 * 9 - Thick - StairHeight * 4])
{
    rotate([0, 0, -180])
    {
        Stair02();
    }
}

// Stair 3
translate([0, 0, 12 * 9 - StairHeight * 5])
{
    rotate([180, 0, -90])
    {
        Stair02();
    }
}

// Stair 4
translate([0, 0, 12 * 9 - StairHeight * 6])
{
    rotate([180, 0, -90])
    {
        Stair01();
    }
}

// Stair 5
translate([0, 0, 12 * 9 - Thick - StairHeight * 7])
{
    rotate([0, 0, -90])
    {
        Stair01();
    }
}

// Stair 6
translate([0, 0, 12 * 9 - Thick - StairHeight * 8])
{
    rotate([0, 0, -90])
    {
        Stair02();
    }
}

// Stair 7
translate([0, 0, 12 * 9 - StairHeight * 9])
{
    rotate([180, 0, 0])
    {
        Stair02();
    }
}

// Stair 8
translate([0, -15, 12 * 9 - Thick - StairHeight * 10])
{
    rotate([0, 0, 0])
    {
        Stair03();
    }
}

// Stair 0-3
translate([3.5 / 2 - Thick, 3.5 / 2, 12 * 9 - Thick - StairHeight * 11])
{
    rotate([0, 0, 0])
    {
        Stair00();
    }
}

// Stair 0-4
translate([3.5 / 2 -  Thick, 10, 12 * 9 - Thick - StairHeight * 12])
{
    rotate([0, 0, 0])
    {
        Stair00();
    }
}


module StairBase01()
{
    color([0.7, 0.9, 0.7])
    stair_board(0, 0, 0, 6.7, StairWidth + 20, 6.7, StairWidth + 20, 0, 1.5);
}

module StairBase02()
{
    color([0.7, 0.9, 0])
    stair_board(0, 0, 0, 6.7, 20 - PoleThick, 6.7, 20 - PoleThick, 0, 1.5);
}

module StairBase03()
{
    color([0.7, 0.4, 0.7])
    stair_board(0, 0, 0, 6.7, StairWidth * 2 + PoleThick, 6.7, StairWidth * 2 + PoleThick, 0, 1.5);
}

// Stair base 1
translate([-StairWidth - PoleThick / 2, 20 - PoleThick / 2, 12 * 9 - StairHeight * 2])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

translate([-StairWidth - PoleThick / 2, 20 - PoleThick / 2, 12 * 9 - StairHeight * 3])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

translate([-StairWidth - PoleThick / 2, 20 - PoleThick / 2, 12 * 9 - StairHeight * 4])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

translate([-StairWidth - PoleThick / 2, 20 - PoleThick / 2, 12 * 9 - StairHeight * 5])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

// Stair base 2
translate([-(PoleThick / 2 - Thick), 20 - PoleThick / 2, 12 * 9 - StairHeight * 2])
{
    rotate([90, 0, 270])
    {
        StairBase02();
    }
}

translate([-(PoleThick / 2 - Thick), 20 - PoleThick / 2, 12 * 9 - StairHeight * 3])
{
    rotate([90, 0, 270])
    {
        StairBase02();
    }
}

// Stair base 3
translate([StairWidth + PoleThick / 2, -StairWidth - Thick - PoleThick / 2, 12 * 9 - StairHeight * 6])
{
    rotate([90, 0, 180])
    {
        StairBase03();
    }
}

translate([StairWidth + PoleThick / 2, -StairWidth - Thick - PoleThick / 2, 12 * 9 - StairHeight * 7])
{
    rotate([90, 0, 180])
    {
        StairBase03();
    }
}

translate([StairWidth + PoleThick / 2, -StairWidth - Thick - PoleThick / 2, 12 * 9 - StairHeight * 8])
{
    rotate([90, 0, 180])
    {
        StairBase03();
    }
}

translate([StairWidth + PoleThick / 2, -StairWidth - Thick - PoleThick / 2, 12 * 9 - StairHeight * 9])
{
    rotate([90, 0, 180])
    {
        StairBase03();
    }
}

// Stair base 4
translate([StairWidth + PoleThick / 2 + Thick, 20 - PoleThick / 2, 12 * 9 - StairHeight * 10])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

translate([StairWidth + PoleThick / 2 + Thick, 20 - PoleThick / 2, 12 * 9 - StairHeight * 11])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

translate([StairWidth + PoleThick / 2 + Thick, 20 - PoleThick / 2, 12 * 9 - StairHeight * 12])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

translate([StairWidth + PoleThick / 2 + Thick, 20 - PoleThick / 2, 12 * 9 - StairHeight * 13])
{
    rotate([90, 0, 270])
    {
        StairBase01();
    }
}

// Stair base 5
translate([PoleThick / 2, 20 - PoleThick / 2, 12 * 9 - StairHeight * 12])
{
    rotate([90, 0, 270])
    {
        StairBase02();
    }
}

translate([PoleThick  / 2, 20 - PoleThick / 2, 12 * 9 - StairHeight * 13])
{
    rotate([90, 0, 270])
    {
        StairBase02();
    }
}


// deck

translate([-33.5, 20 -3.5 / 2, 0])
{
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

    translate([63.5, 2, 12 * 9 + 1.5])
    {
        board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
    }

    translate([30 + 3.5 / 2, 2, 12 * 9 + 1.5])
    {
        board(3.5, 3.5, 12 * 4, 0.5, 0.7, 1);
    }

    translate([0, 2, 12 * 9 + 1.5])
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

    translate([33.5 * 2, 3.5 + 2, 12 * 13])
    {
        rotate([0, 0, -90])
        {
            color([1, 0, 1])
            board(3.5, 12 * 6 + 0.5 , 1.5, 1, 0, 0);
        }
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