package os1;
/**
 * @author Andrew
 * @date 2018/10/7
 */
import java.util.LinkedList;

public class Memory {
    private int size;
    private static final int MIN_SIZE = 2;
    private LinkedList<Zone> zones;
    private int pointer;

    class Zone{
        private int size;
        private int head;
        private int id;
        private boolean isFree;

        public Zone(int head,int size,int id){
            this.head = head;
            this.size = size;
            this.id = id;
            this.isFree = true;
        }

        public int getId() {
            return id;
        }
        public void setId(int id) {
            this.id = id;
        }
    }

    public Memory(int head,int size){
        this.size = size;
        this.pointer = 0;
        this.zones = new LinkedList<>();
        zones.add(new Zone(head,size,0));
    }
    //最佳适应
    public boolean bestFit(int size,int id){
        int flag = -1;
        int min = this.size;
        for(pointer = 0; pointer < zones.size() ;pointer++){
            Zone tmp = zones.get(pointer);
            if(tmp.isFree && (tmp.size >size)){
                if(min > tmp.size - size){
                    min = tmp.size - size;
                    flag = pointer;
                }
            }
        }
        if(flag == -1){
            System.out.println("无可用内存空间！ 创建失败");
            return false;
        }else{
            doAllocation(size,flag,zones.get(flag),id);
            return true;
        }
    }
    //分配内存
    private void doAllocation(int size,int location,Zone tmp,int id){
        if(tmp.size - size <= MIN_SIZE){
            tmp.isFree = false;
        }else{
            zones.get(location).setId(id);
            Zone split = new Zone(tmp.head + size,tmp.size-size,0);
            zones.add(location+1,split);
            tmp.size = size;
            tmp.isFree = false;
        }
       // System.out.println("成功分配 " + size + "KB 内存!");
    }
    //回收
    public void collection(int id){
        int lSize = zones.size();
        int i;
        for (i=0; i<lSize; i++) {
            if(id == zones.get(i).getId()){
                System.out.println(i);
                break;
            }
        }
        id = i;
        if(id >= zones.size() ){
            //System.out.println("无此分区编号");
            return;
        }
        Zone tmp = zones.get(id);
        if(tmp.isFree){
           // System.out.println("未被分配，无需回收");
            return;
        }
        if (id < zones.size() - 1 && zones.get(id + 1).isFree){
            Zone next = zones.get(id + 1);
            tmp.size += next.size;
            zones.remove(next);
        }
        if (id > 0 && zones.get(id - 1).isFree){
            Zone previous = zones.get(id - 1);
            previous.size += tmp.size;
            zones.remove(id);
            id--;
        }
        zones.get(id).isFree = true;
        zones.get(id).setId(0);
       // System.out.println("内存回收成功!, 本次回收了 " + size + "KB 空间!");
    }

    public void showZones() {
        System.out.println("-------------------------------------------------------");
        System.out.println("分区ID\t\t分区始址\t\t分区大小\t\t空闲状态\t");
        System.out.println("-------------------------------------------------------");
        for (int i = 0; i < zones.size(); i++) {
            Zone tmp = zones.get(i);
            if (tmp.isFree == true) {
                System.out.println(tmp.id+ "\t\t\t\t" + tmp.head + "\t\t\t\t" + tmp.size + "\t\t\t\t" + "空闲");
            } else {
                System.out.println(tmp.id+ "\t\t\t\t" + tmp.head + "\t\t\t\t" + tmp.size + "\t\t\t\t" + "占用");
            }
        }
        System.out.println("-------------------------------------------------------");
    }
}
