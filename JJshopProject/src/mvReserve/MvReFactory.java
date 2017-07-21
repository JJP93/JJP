package mvReserve;

public class MvReFactory {
	
	private MvReFactory(){}
	
	private static MvReFactory instance = new MvReFactory();
	
	public static MvReFactory getInstance(){
		return instance;
	}
	 
	public CommandIf createCommand(String cmd){
		CommandIf cmdIf = null;
		if (cmd.equals("/mvrelist.mvReserve")){
			cmdIf = new MvreListCommander();
		}
		return cmdIf;
	}
}









