package bean;

public class Product {
	private int ID;
	private String productName;
    private String collection;
    private double price;
    private String imageUrl;
    private String description;
	
    // Default constructor
    public Product() {
    }

    // Parameterized constructor
    public Product(int ID ,String productName, String collection, double price, String imageUrl, String description) {
        this.productName = productName;
        this.collection = collection;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        
        
    }

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		this.collection = collection;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Product [ID=" + ID + ", productName=" + productName + ", collection=" + collection + ", price=" + price
				+ ", imageUrl=" + imageUrl + ", description=" + description + ", getID()=" + getID()
				+ ", getProductName()=" + getProductName() + ", getCollection()=" + getCollection() + ", getPrice()="
				+ getPrice() + ", getImageUrl()=" + getImageUrl() + ", getDescription()=" + getDescription()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
