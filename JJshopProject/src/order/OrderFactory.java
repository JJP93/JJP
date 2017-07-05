package order;

public class OrderFactory {
	
	private OrderFactory(){}
	
	private static OrderFactory instance = new OrderFactory();
	
	public static OrderFactory getInstance(){
		return instance;
	}
	 
	public CommandIf createCommand(String cmd){
		
		CommandIf cmdIf = null;
		if (cmd.equals("/orderInsert.order")){
			cmdIf = new OrderInsertCommander();
		}else if (cmd.equals("/orderlist.order")){
			cmdIf = new OrderlistCommander();
		}
		
		return cmdIf;
	}
}









