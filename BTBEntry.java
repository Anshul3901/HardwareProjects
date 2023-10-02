
public class BTBEntry {
    protected int curr;
    protected int next;
    protected int prediction;

    public BTBEntry(int curr, int next){
        this.curr = curr;
        this.next = next;
        this.prediction = 1;
    }

    public static void Taken(BTBEntry curr){
        int pred = curr.prediction;
        switch (pred) {
            case 0: {
                curr.prediction = 0;
                break;
            }
            case 1: {
                curr.prediction = 0;
                break;
            }
            case 2: {
                curr.prediction = 0;
                break;
            }
            case 3: {
                curr.prediction = 2;
                break;
            }
        }
    }

    public static void NotTaken(BTBEntry curr){
        int pred = curr.prediction;
        switch (pred) {
            case 0: {
                curr.prediction = 1;
                break;
            }
            case 1: {
                curr.prediction = 2;
                break;
            }
            case 2:  {
                curr.prediction = 3;
                break;
            }
            case 3:  {
                curr.prediction = 3;
                break;
            }
        }
        
    }

    public static void setNext(BTBEntry curr, int newNext){
        curr.next = newNext;
    }
    public static void setCurr(BTBEntry curr, int newCurr){
        curr.curr = newCurr;
    }
}
