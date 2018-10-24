package os1;
/**
 * 双端链表
 * @author Andrew
 * @date 2018/10/6
 */
public class DoubleLinkList {
    private Node head;
    private Node tail;
    private int size;

    private class Node{
        private Pcb pcbData;
        private Node next;

        public Node(Pcb pcbData){
            this.pcbData = pcbData;
        }
    }

    public DoubleLinkList(){
        size = 0;
        head = null;
        tail = null;
    }

    public void addTail(Pcb pcbData){
        Node node = new Node(pcbData);
        if(size == 0) {
            head = node;
            tail = node;
            size++;
        }else{
            tail.next = node;
            tail = node;
            size++;
        }
    }

    public boolean deleteHead(){
        if(size == 0){
            return false;
        }
        if(head.next == null){
            head = null;
            tail = null;
        }else{
            head = head.next;
        }
        size--;
        return true;
    }

    public boolean isEmpty(){
        return (size == 0);
    }

    public int getSize(){
        return  size;
    }
    public Pcb getHead(){
        return head.pcbData;
    }

    public void display(){
        if(size > 0 ){
            Node node = head;
            int tempSize = size;
            if(tempSize == 1){
                System.out.print("("+node.pcbData.name+" )");
                System.out.println();
                return;
            }
            while(tempSize > 0){
                if(node.equals(head)){
                    System.out.print("("+node.pcbData.name+"  "+node.pcbData.id+" ->");
                }else if(node.next == null){
                    System.out.print(" "+node.pcbData.name+"  "+node.pcbData.id+" )");
                }else{
                    System.out.print(" "+node.pcbData.name+"  "+node.pcbData.id+" ->");
                }
                node = node.next;
                tempSize--;
            }
            System.out.println();
        }else{
            System.out.println("空");
        }
    }

}
