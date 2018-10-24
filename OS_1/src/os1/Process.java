package os1;

/**
 * @author Andrew
 * @date 2018/10/6
 */
import java.util.Scanner;
public class Process {

    public void Init(QueueLink Que){
        for(int i = 0;i < 8 ;i++){
            Pcb pcb = new Pcb();
            Que.insert(pcb);
        }
    }
    //创建进程
    public void Create(QueueLink pcb,QueueLink ready,QueueLink run,Memory memory){
        if(!pcb.isEmpty()){
            Pcb newPcb = new Pcb();
            Scanner Input = new Scanner(System.in);
            System.out.print("进程名字：");
            newPcb.name = Input.nextLine();
            System.out.print("内存：");
            int size = Input.nextInt();
            System.out.print("ID：");
            newPcb.id = Input.nextInt();
            boolean flag = memory.bestFit(size,newPcb.id);
            if(flag) {
                ready.insert(newPcb);
                if (run.isEmpty()) {
                    Pcb twoPcb = ready.getHead();
                    run.insert(twoPcb);
                    ready.delete();
                }
                pcb.delete();
                System.out.println("进程" + newPcb.name + "创建成功");
            }
        }else{
            System.out.println("创建失败");
        }

    }
    //时间片到
    public void Timer(QueueLink ready,QueueLink run){
        if(run.isEmpty() == true){
            System.out.println("没有正在运行的进程");
            return;
        }
        Pcb timePcb = run.getHead();
        ready.insert(timePcb);
        System.out.println("进程"+timePcb.name+"时间片到");
        timePcb = ready.getHead();
        run.insert(timePcb);
        run.delete();
        ready.delete();
    }
    //阻塞进程
    public void Block(QueueLink ready,QueueLink run,QueueLink block){
        if(!run.isEmpty()) {
            Pcb blockPcb = run.getHead();
            block.insert(blockPcb);
            run.delete();
            System.out.println("进程"+blockPcb.name+"被阻塞");
            if(!ready.isEmpty()) {
                blockPcb = ready.getHead();
                run.insert(blockPcb);
                ready.delete();
            }
        }else{
            System.out.println("没有运行的进程");
        }
    }
    //唤醒进程
    public void WakeUp(QueueLink ready,QueueLink run,QueueLink block){
        if(!block.isEmpty()){
            Pcb wakeUpPcb = block.getHead();
            if(ready.isEmpty() && run.isEmpty()){
                run.insert(wakeUpPcb);
            }else{
                ready.insert(wakeUpPcb);
            }
            block.delete();
            System.out.println("进程"+wakeUpPcb.name+"被唤醒");
        }else{
            System.out.println("没有阻塞的进程");
        }
    }
    //结束进程
    public void Exit(QueueLink pcb,QueueLink ready,QueueLink run,Memory memory){
        if (run.isEmpty() == true){
            System.out.println("没有正在运行的进程");
            return;
        }
        String temple = run.getHead().name;
        int id = run.getHead().id;
        run.delete();
        memory.collection(id);
        System.out.println("进程"+temple+"结束");
        pcb.insert(new Pcb());
        if(!ready.isEmpty()){
            Pcb readyPcb = ready.getHead();
            run.insert(readyPcb);
            ready.delete();
        }else{
            System.out.println("没有运行的进程");
        }
    }
    // 显示队列
    public void Display(QueueLink pcb,QueueLink ready,QueueLink run,QueueLink block,Memory memory){
        System.out.print("空白PCB :");
        pcb.display();
        System.out.print("就绪队列 :");
        ready.display();
        System.out.print("执行队列 :");
        run.display();
        System.out.print("阻塞队列 :");
        block.display();
        memory.showZones();

    }
    public void Menu(QueueLink PCB,QueueLink ready,QueueLink run,QueueLink block,Memory memory){
        boolean flag = true;
        while(flag) {
            System.out.println("   ");
            System.out.println("1-----------创建进程");
            System.out.println("2-----------时间片到");
            System.out.println("3-----------阻塞进程");
            System.out.println("4-----------唤醒进程");
            System.out.println("5-----------结束进程");
            System.out.println("6-----------显示队列");
            System.out.println("7-----------  退出  ");
            int Opertion = 0;
            Scanner Input = new Scanner(System.in);
            Opertion = Input.nextInt();
            switch (Opertion) {
                case 1:
                    Create(PCB,ready,run,memory);
                    break;
                case 2:
                    Timer(ready,run);
                    break;
                case 3:
                    Block(ready,run,block);
                    break;
                case 4:
                    WakeUp(ready,run,block);
                    break;
                case 5:
                    Exit(PCB,ready,run,memory);
                    break;
                case 6:
                    Display(PCB,ready,run,block,memory);
                    break;
                case 7:
                    flag = false;
                    break;
                default:
                    System.out.println(" 选项错误 ");
            }
        }

    }
    public static void main(String []args){
        Process process = new Process();
        QueueLink queuePCB = new QueueLink();
        QueueLink queueReady = new QueueLink();
        QueueLink queueRun = new QueueLink();
        QueueLink queueBlock = new QueueLink();
        System.out.println("请输入起始位置");
        Scanner Input = new Scanner(System.in);
        int Start = Input.nextInt();
        System.out.println("请输入初始内存大小");
        int Mem = Input.nextInt();
        Memory memory = new Memory(Start,Mem);
        process.Init(queuePCB);
        process.Menu(queuePCB,queueReady,queueRun,queueBlock,memory);
    }
}
