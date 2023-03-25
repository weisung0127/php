
<?php
// 範例:
// 虛擬帳號長度共16碼：
// 企業戶代碼(6): 125501
// 經銷商代號(9): 010126789
// 金額:$ 8,520
//   所產生最右一位之檢查碼為:
//   1. 帳號部分:由左至右各位數之權數分別為6,5,4,3,2,1,9,8,7,6,5,4,3,2,1
//   2. 金額部分:由左至右各位數之權數分別為4,3,2,1
//   3.位數與其權數乘積之和除以11，所得餘數即為檢查碼；若餘數為10時，其檢查碼為0
//   4.檢查碼為
// 帳號部分:1*6+2*5+5*4+5*3+0*2+1*1+0*9+1*8+0*7+1*6+2*5+6*4+7*3+8*2+9*1
//             = 6+10+20+15+0+1+0+8+0+6+10+24+21+16+9 = 146
//     金額部分:8*4+5*3+2*2+0*1=51
//     故(146+51)/11 =17餘10 檢查碼應為0


 function GetVirtualAccountCheckValue(string $Str1, string $Str2, string $Str3): string
    {
        if (strlen($Str1) !=6 ||strlen($Str2) != 9)
        {
            echo"輸入的字碼不對";
            return("error");
        }
        else{     
            $V1 = 0; $V2 = 0;//V1是帳號,V2是金額
            $V1 = 6*$Str1[0] + 5*$Str1[1] + 4*$Str1[2] + 3*$Str1[3] + 2*$Str1[4] + 1*$Str1[5] +
                 9*$Str2[0] + 8*$Str2[1] + 7*$Str2[2] + 6*$Str2[3] + 5*$Str2[4] + 4*$Str2[5]+
                 3*$Str2[6] + 2*$Str2[7] + 1*$Str2[8];

            $j = strlen($Str3); 
            for ($i = 0; $i < strlen($Str3); $i++) 
            {
                $N1 = $Str3[$i];
                $V2 += $N1*$j;
                $j--;
            }
            $V = $V1 + $V2;

            $check = $V % 11 % 10;

            echo "檢查碼是: ". (string)($check). "<br>" ;
            $totle = (string)($Str1.$Str2.$check);
            echo"總長度: $totle";
            return (string) ($V % 11 % 10);

            // if (strlen($Str3)==4)
            // {
            //     $V = $V + 4*$Str3[0] + 3*$Str3[1] + 2*$Str3[2] + 1*$Str3[3] ;
            //     $check = $V % 11 % 10;
            //     echo"檢查碼: $check";
            //     $totle = (string)($Str1.$Str2.$check);
            //     echo"總長度: $totle";
            //     return (string) ($V % 11 % 10);
            // }
            // elseif (strlen($Str3)==5)
            // {
            //     $V = $V + 5*$Str3[0] + 4*$Str3[1] + 3*$Str3[2] + 2*$Str3[3] + 1*$Str3[4] ;
            //     $check = $V % 11 % 10;
            //     echo"檢查碼: $check";
            //     $totle = (string)($Str1.$Str2.$check);
            //     echo"總長度: $totle";
            //     return (string) ($V % 11 % 10);
            // }elseif (strlen($Str3)==3)
            // {
            //     $V = $V + 3*$Str3[0] + 2*$Str3[1] + 1*$Str3[2] ;
            //     $check = $V % 11 % 10;
            //     echo"檢查碼: $check";
            //     $totle = (string)($Str1.$Str2.$check);
            //     echo"總長度: $totle";
            //     return (string) ($V % 11 % 10);
            // }elseif (strlen($Str3)==2)
            // {
            //     $V = $V + 2*$Str3[0] + 1*$Str3[1] ;
            //     $check = $V % 11 % 10;
            //     echo"檢查碼: $check";
            //     $totle = (string)($Str1.$Str2.$check);
            //     echo"總長度: $totle";
            //     return (string) ($V % 11 % 10);
            // }else{
            //     echo"金額不在範圍內";
            //     return("error");
            // }

        }
    }

    GetVirtualAccountCheckValue("125501", "010126789","8520");


        ?>