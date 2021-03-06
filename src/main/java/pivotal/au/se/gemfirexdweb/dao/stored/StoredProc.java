/*
Copyright (C) MARCH-2014 Pivotal Software, Inc.

All rights reserved. This program and the accompanying materials
are made available under the terms of the under the Apache License,
Version 2.0 (the "License”); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
package pivotal.au.se.gemfirexdweb.dao.stored;

public class StoredProc 
{
	
	private String schemaName;
    private String name;
    private String javaClassName;
  
  	public StoredProc()
  	{
  	}

	public StoredProc(String schemaName , String name, String javaClassName) 
	{
		super();
		this.schemaName = schemaName;
		this.name = name;
		this.javaClassName = javaClassName;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getJavaClassName() {
		return javaClassName;
	}
	
	public void setJavaClassName(String javaClassName) {
		this.javaClassName = javaClassName;
	}

	
	public String getSchemaName() {
		return schemaName;
	}

	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
	}

	@Override
	public String toString() {
		return "StoredProc [schemaName=" + schemaName + ", name=" + name
				+ ", javaClassName=" + javaClassName + "]";
	}
  
	
  
}
