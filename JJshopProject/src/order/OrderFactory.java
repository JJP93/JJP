package order;

public class OrderFactory {
	
	private OrderFactory(){}
	
	private static OrderFactory instance = new OrderFactory();
	
	public static OrderFactory getInstance(){
		return instance;
	}
	 
	public CommandIf createCommand(String cmd){
		
		CommandIf cmdIf = null;
		if (cmd.equals("/Order.shop")){
			cmdIf = new OrderMainCommender();
		}
		
		return cmdIf;
	}
}









