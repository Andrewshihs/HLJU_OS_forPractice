package os1;
/**
 * PCb数据结构
 * @author Andrew
 * @date 2018/10/6
 */
public class Pcb {
    public int id;
    public String name;
    Pcb(){
        id = 0;
        name = "null";
    }
    Pcb(int id, String name){
        this.id = id;
        this.name = name;
    }
}
