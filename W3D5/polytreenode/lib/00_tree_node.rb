class PolyTreeNode
    attr_reader :value, :parent, :children
    
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        @parent.children.delete(self) if @parent
        @parent = new_parent
        @parent.children << self if !@parent.nil? && !@parent.children.include?(self)
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if !@children.include?(child)
            raise 'Not my child'
        end
        child.parent = nil
    end

    def dfs(target)
        return self if @value == target
        @children.each do |child|
            node = child.dfs(target)
            return node if !node.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target
            node.children.each { |child| queue << child}
        end
        nil
    end
end




    #     a
    #    / \
    #   b   c

    #   b.parent = a
    #   a.children [] => [b]
    #   c.parent = a
    #   a.children [b] => [b,c]
    #   b.parent = a
    #   a.children [b,c] => [b,c]