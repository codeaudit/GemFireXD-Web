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
package pivotal.au.se.gemfirexdweb.dao.gatewayrecievers;

import java.util.List;

import pivotal.au.se.gemfirexdweb.main.Result;
import pivotal.au.se.gemfirexdweb.main.SqlFireException;

public interface GatewayReceiverDAO 
{
	public List<GatewayReceiver> retrieveGatewayReceiverList(String schema, String search, String userKey) throws SqlFireException;
	
	public Result simplegatewayReceiverCommand (String id, String type, String userKey) throws SqlFireException;
	
	public javax.servlet.jsp.jstl.sql.Result getGatewayRecieverInfo (String id, String userKey) throws SqlFireException;

    public String generateDDL (String id, String userKey) throws SqlFireException;
}
