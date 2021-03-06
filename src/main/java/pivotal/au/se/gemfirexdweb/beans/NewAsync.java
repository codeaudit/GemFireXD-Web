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
package pivotal.au.se.gemfirexdweb.beans;

public class NewAsync
{
    private String asyncName;
    private String listenerClass;
    private String initParams;
    private String manualStart;
    private String enableBatchConflation;
    private String batchSize;
    private String batchTimeInterval;
    private String enablePersistence;
    private String diskStore;
    private String maxQueueMemory;
    private String alertThreshold;
    private String serverGroups;

    public NewAsync() {
    }

    public NewAsync(String asyncName, String listenerClass, String initParams, String manualStart, String enableBatchConflation, String batchSize, String batchTimeInterval, String enablePersistence, String diskStore, String maxQueueMemory, String alertThreshold, String serverGroups) {
        this.asyncName = asyncName;
        this.listenerClass = listenerClass;
        this.initParams = initParams;
        this.manualStart = manualStart;
        this.enableBatchConflation = enableBatchConflation;
        this.batchSize = batchSize;
        this.batchTimeInterval = batchTimeInterval;
        this.enablePersistence = enablePersistence;
        this.diskStore = diskStore;
        this.maxQueueMemory = maxQueueMemory;
        this.alertThreshold = alertThreshold;
        this.serverGroups = serverGroups;
    }

    public String getAsyncName() {
        return asyncName;
    }

    public void setAsyncName(String asyncName) {
        this.asyncName = asyncName;
    }

    public String getListenerClass() {
        return listenerClass;
    }

    public void setListenerClass(String listenerClass) {
        this.listenerClass = listenerClass;
    }

    public String getInitParams() {
        return initParams;
    }

    public void setInitParams(String initParams) {
        this.initParams = initParams;
    }

    public String getManualStart() {
        return manualStart;
    }

    public void setManualStart(String manualStart) {
        this.manualStart = manualStart;
    }

    public String getEnableBatchConflation() {
        return enableBatchConflation;
    }

    public void setEnableBatchConflation(String enableBatchConflation) {
        this.enableBatchConflation = enableBatchConflation;
    }

    public String getBatchSize() {
        return batchSize;
    }

    public void setBatchSize(String batchSize) {
        this.batchSize = batchSize;
    }

    public String getBatchTimeInterval() {
        return batchTimeInterval;
    }

    public void setBatchTimeInterval(String batchTimeInterval) {
        this.batchTimeInterval = batchTimeInterval;
    }

    public String getEnablePersistence() {
        return enablePersistence;
    }

    public void setEnablePersistence(String enablePersistence) {
        this.enablePersistence = enablePersistence;
    }

    public String getDiskStore() {
        return diskStore;
    }

    public void setDiskStore(String diskStore) {
        this.diskStore = diskStore;
    }

    public String getMaxQueueMemory() {
        return maxQueueMemory;
    }

    public void setMaxQueueMemory(String maxQueueMemory) {
        this.maxQueueMemory = maxQueueMemory;
    }

    public String getAlertThreshold() {
        return alertThreshold;
    }

    public void setAlertThreshold(String alertThreshold) {
        this.alertThreshold = alertThreshold;
    }

    public String getServerGroups() {
        return serverGroups;
    }

    public void setServerGroups(String serverGroups) {
        this.serverGroups = serverGroups;
    }

    @Override
    public String toString() {
        return "NewAsync{" +
                "asyncName='" + asyncName + '\'' +
                ", listenerClass='" + listenerClass + '\'' +
                ", initParams='" + initParams + '\'' +
                ", manualStart='" + manualStart + '\'' +
                ", enableBatchConflation='" + enableBatchConflation + '\'' +
                ", batchSize='" + batchSize + '\'' +
                ", batchTimeInterval='" + batchTimeInterval + '\'' +
                ", enablePersistence='" + enablePersistence + '\'' +
                ", diskStore='" + diskStore + '\'' +
                ", maxQueueMemory='" + maxQueueMemory + '\'' +
                ", alertThreshold='" + alertThreshold + '\'' +
                ", serverGroups='" + serverGroups + '\'' +
                '}';
    }
}
