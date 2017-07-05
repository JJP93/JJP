package order;

public class OrderFactory {
	
	private OrderFactory(){}
	
	private static OrderFactory instance = new OrderFactory();
	
	public static OrderFactory getInstance(){
		return instance;
	}
	 
	public CommandIf createCommand(String cmd){
		
		CommandIf cmdIf = null;
		if (cmd.equals("/Order.order")){
			cmdIf = new OrderMainCommender();
		}else if (cmd.equals("/orderInsert.order")){
			cmdIf = new OrderInsertCommander();
		}
		
		return cmdIf;
	}
}









