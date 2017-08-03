""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""

def check_binary_search_tree_(root):
    return check_order(root, 0, 10**4)

def check_order(node, min, max):
    if node is None: 
        return True

    return min < node.data and node.data < max and check_order(node.left, min, node.data) and check_order(node.right, node.data, max)
