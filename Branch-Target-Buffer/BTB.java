import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.*;

public class BTB{
    static BTBEntry[] btb = new BTBEntry[1024];
    static double hit = 0;
    static double miss = 0;
    static double right = 0;
    static double wrong = 0;
    static double wrong_addr = 0;
    static double collision = 0;
    static double taken = 0;
    static double stall = 0;
    static double inst = 0;

    public static void main(String[] args) throws FileNotFoundException{
        try{
            File entries = new File("Espresso_int.txt");
            Scanner scan = new Scanner(entries);
            String next_PC = scan.nextLine();
            String curr_PC;
            System.out.println("Running... "+entries.getName());
            System.out.println("State Machine B");
            while(scan.hasNextLine()){
                curr_PC = next_PC;
                next_PC = scan.nextLine();
                if(next_PC == ""){
                    break;
                }
                int btb_locater = Integer.parseInt(curr_PC.substring(curr_PC.length() - 3), 16) / 4;
                int PC = Integer.parseInt(curr_PC, 16);
                int next = Integer.parseInt(next_PC, 16);
                if(btb[btb_locater] != null){
                    if(btb[btb_locater].curr == PC){
                        hit++;
                        int pred_PC;
                        int prediction = btb[btb_locater].prediction;
                        if(prediction < 2){
                            pred_PC = btb[btb_locater].next;
                            if(next == pred_PC){
                                right++;
                                BTBEntry.Taken(btb[btb_locater]);
                                taken++;
                                
                            }
                            else{
                                wrong++;
                                stall++;
                                if(PC + 4 == next){
                                    BTBEntry.NotTaken(btb[btb_locater]);
                                }
                                else{
                                    BTBEntry.setNext(btb[btb_locater], next);
                                    wrong_addr++;
                                }
                            }
                        }
                        else{
                            if(PC + 4 == next){
                                right++;
                                BTBEntry.NotTaken(btb[btb_locater]);
                            }
                            else{
                                wrong++;
                                stall++;
                                BTBEntry.Taken(btb[btb_locater]);
                                taken++;
                            }
                        }
                    }
                    else{
                        if(PC + 4 != next){
                            collision++;
                            BTBEntry newEntry = new BTBEntry(PC, next);
                            btb[btb_locater] = newEntry;
                            miss++;
                            stall++;
                        }
                    }
                }
                else{
                    if(PC + 4 != next){
                        BTBEntry newEntry = new BTBEntry(PC, next);
                        btb[btb_locater] = newEntry;
                        miss++;
                        stall++;
                    }
                }
            }
            scan.close();
            System.out.println("Hit: "+(int)hit);
            System.out.println("Miss: "+(int)miss);
            System.out.println("Right: "+(int)right);
            System.out.println("Wrong: "+(int)wrong);
            System.out.println("Wrong_addr: "+(int)wrong_addr);
            System.out.println("Collision: "+(int)collision);
            System.out.println("Stall: "+(int)stall);
            System.out.println("Taken: "+(int)taken);;
            System.out.println("Hit Rate: "+(double)(hit/(hit + miss)*100)+"%");
            System.out.println("Accuracy: "+(double)(right/hit*100)+"%");
            System.out.println("Wrong Percentage: "+(double)(wrong_addr/wrong*100)+"%");
            try{
                PrintWriter printer = new PrintWriter("btb.txt");
                printer.println("Index    PC     Target    Prediction");
                for(int i = 0; i < btb.length; i++){
                    if(btb[i] != null){
                        String prediction_bin = "";
                        switch(btb[i].prediction){
                            case 0:{
                                prediction_bin = "00";
                                break;
                            }
                            case 1: {
                                prediction_bin = "01";
                                break;
                            }
                            case 2:{
                                prediction_bin = "10";
                                break;
                            }
                            case 3:{
                                prediction_bin = "11";
                                break;
                            }
                        }
                        printer.println(i+"    "+Integer.toHexString(btb[i].curr)+"    "+Integer.toHexString(btb[i].next)+"    "+prediction_bin);
                    }
                }
                printer.close();
            }
            catch(Exception e){
                throw e;
            }
        }
        catch(FileNotFoundException e){
            throw e;
        }
    }

}

