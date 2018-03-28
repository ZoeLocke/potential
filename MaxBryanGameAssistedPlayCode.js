function SetLegals()
    {
        ClearLegals();
        var x = Selected.x;
        var y = Selected.y;
        // HERE WE GOES !!!!
        for (var i = -1 ; i < 2 ; i++)
        {
            for (var j = -1 ; j < 2 ; j++)
            {
                if (x+i >=0 && x+i <=9 && y+j >=0 && y+j <=9 )
                {
                    if (g[x+i][y+j].color == null)      Legals[x+i][y+j] = true;
                    else if ( x+(i*2) >=0 && x+(i*2) <=9 && y+(j*2) >=0 && y+(j*2) <=9 )
                    {
                        if (g[x+(i*2)][y+(j*2)].color == null)      Legals[x+(i*2)][y+(j*2)] = true;
                    }
                }
            }
        }
    }