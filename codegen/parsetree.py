from lark import Tree


class Node:
    def __init__(self, data, parent):
        self.data = data
        self.parent = parent
        self.child = []

    def add_child(self, index):
        self.child.append(index)

    def __repr__(self):
        return "[" + str(self.data) + ", " + str(self.parent) + ", " + str(self.child) + "]"


class ParseTree:
    def __init__(self, lark_tree):
        self.nodes = []
        self.construct(lark_tree, None)

    def construct(self, lark_tree, index):
        if not isinstance(lark_tree, Tree):
            self.nodes.append(Node(lark_tree, index))
            return len(self.nodes) - 1
        next_index = len(self.nodes)
        self.nodes.append(Node(lark_tree.data, index))
        for child in lark_tree.children:
            ret = self.construct(child, next_index)
            self.nodes[next_index].add_child(ret)
        return next_index
