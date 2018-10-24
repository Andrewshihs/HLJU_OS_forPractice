package os1;

/**
 * 双端队列
 * @author Andrew
 * @date 2018/10/6
 */
public class QueueLink {
    private DoubleLinkList Dl;

    public QueueLink(){
        Dl = new DoubleLinkList();
    }

    public void insert(Pcb data){
        Dl.addTail(data);
    }

    public void delete(){
        Dl.deleteHead();
    }

    public boolean isEmpty(){
        return Dl.isEmpty();
    }

    public int getSize(){
        return Dl.getSize();
    }

    public void display(){
        Dl.display();
    }
    public Pcb getHead(){
        return Dl.getHead();
    }
}
