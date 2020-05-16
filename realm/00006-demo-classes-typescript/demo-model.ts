import * as Realm from "realm";

export type RealmTestClass0 = {
    integerValue: number;
    stringValue?: string;
    dataValue?: ArrayBuffer;
};

export const RealmTestClass0Schema = {
  name: 'RealmTestClass0',
  properties: {
    integerValue: 'int',
    stringValue: 'string?',
    dataValue: 'data?'
  }
};

export type RealmTestClass1 = {
    integerValue: number;
    boolValue: boolean;
    floatValue: number;
    doubleValue: number;
    stringValue?: string;
    dateValue?: Date;
    arrayReference: Array<RealmTestClass0>;
};

export const RealmTestClass1Schema = {
  name: 'RealmTestClass1',
  properties: {
    integerValue: 'int',
    boolValue: 'bool',
    floatValue: 'float',
    doubleValue: 'double',
    stringValue: 'string?',
    dateValue: 'date?',
    arrayReference: 'RealmTestClass0[]'
  }
};

export type RealmTestClass2 = {
    integerValue: number;
    boolValue: boolean;
    objectReference?: RealmTestClass1;
};

export const RealmTestClass2Schema = {
  name: 'RealmTestClass2',
  properties: {
    integerValue: 'int',
    boolValue: 'bool',
    objectReference: 'RealmTestClass1'
  }
};

export const Schema = [RealmTestClass0Schema, RealmTestClass1Schema, RealmTestClass2Schema];
