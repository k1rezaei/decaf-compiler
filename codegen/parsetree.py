from lark import Tree


def data_transform(data):
    expr = ["expr", "expr1", "expr2", "expr3", "expr4", "expr5", "expr6", "expr7", "expr8"]
    if data in expr:
        return "expr"
    if data == "forstmtopen" or data == "forstmtclose":
        return "forstmt"
    if data == "whilestmtopen" or data == "whilestmtclose":
        return "whilestmt"
    if data == "ifstmtclose" or data == "ifstmtopen":
        return "ifstmt"
    if data == "closestmt" or data == "openstmt":
        return "stmt"
    return data


class Node:
    def __init__(self, data, parent, ref_parent):
        self.data = data
        self.parent = parent
        self.ref_parent = ref_parent
        self.child = []
        self.ref_child = []
        self.attribute = dict()

    def add_child(self, index, node):
        self.child.append(index)
        self.ref_child.append(node)

    def __repr__(self):
        return "[" + str(self.data) + ", " + str(self.parent) + ", " + str(self.child) + "]"


class ParseTree:
    def __init__(self, lark_tree):
        self.nodes = []
        self.construct(lark_tree, None)

    def construct(self, lark_tree, index):
        if not isinstance(lark_tree, Tree):
            self.nodes.append(Node(data_transform(lark_tree), index, self.nodes[index]))
            #TODO inja benazaram nabayad dg data_transform bezanim chon ina az noe TOKEN hastan, na?
            #TODO va fk konam bayad lark_tree.value bezari inja bara token
            return len(self.nodes) - 1
        next_index = len(self.nodes)
        ref_par = None
        if index is not None:
            ref_par = self.nodes[index]
        self.nodes.append(Node(data_transform(lark_tree.data), index, ref_par))
        for child in lark_tree.children:
            ret = self.construct(child, next_index)
            self.nodes[next_index].add_child(ret, self.nodes[ret])
        return next_index
