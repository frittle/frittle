package frittle;

public enum CardStatus {
	TODO(0), DOING(1), DONE(2);
	
	int order;
	
	CardStatus(int order) {
		this.order = order;
	}
}




