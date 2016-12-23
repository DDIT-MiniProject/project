package com.test.jdbc.loader;

import java.sql.Connection;

public abstract class DataSource {
	
	public abstract  Connection getConnection();

}
