class MinimaxNode
  attr_reader :minimax_value, :action

  #####################################
  # Class Methods

  def self.set_successor_function(prc)
    @@successor_function = prc
  end

  def self.set_evaluation_function(prc)
    @@evaluation_function = prc
  end

  def self.set_termination_test(prc)
    @@termination_test = prc
  end

  #####################################
  # Instance Methods

  def initialize(state, action = nil)
    @state, @action = state, action
  end

  def minimax(depth_limit = Float::INFINITY, take_maximum = true, alpha = Float::INFINITY * -1, beta = Float::INFINITY, depth = 0)
    if leaf_node? || depth == depth_limit
      @minimax_value = get_score
      @action # game is already over
    else
      choose_best_action(depth_limit, take_maximum, alpha, beta, depth)
    end
  end

  #####################################
  private

  def choose_best_action(depth_limit, take_maximum, alpha, beta, depth)
    best_value, best_action = set_best_value(take_maximum), nil

    generate_child_nodes.each do |child_node|
      child_node.minimax(depth_limit, !take_maximum, alpha, beta, depth + 1)

      if child_action_is_better?(child_node, best_value, take_maximum)
        best_value = child_node.minimax_value
        best_action = child_node.action

        if should_prune?(take_maximum, best_value, best_action, alpha, beta)
          return set_value_and_return_action(best_value, best_action)
        else
          alpha, beta = update_alpha_and_beta(take_maximum, best_value, alpha, beta)
        end
      end
    end

    set_value_and_return_action(best_value, best_action)
  end

  def should_prune?(take_maximum, best_value, best_action, alpha, beta)
    take_maximum && best_value > beta || !take_maximum && best_value < alpha
  end

  def set_value_and_return_action(best_value, best_action)
    @minimax_value = best_value
    best_action
  end

  def update_alpha_and_beta(take_maximum, best_value, alpha, beta)
    alpha = best_value if take_maximum && best_value > alpha
    beta = best_value if !take_maximum && best_value < beta

    [alpha, beta]
  end

  def leaf_node?
    @@termination_test.call(@state)
  end

  def generate_child_nodes
    @@successor_function.call(@state)
  end

  def get_score
    @@evaluation_function.call(@state)
  end

  def child_action_is_better?(node, best_value, take_maximum)
    take_maximum ? node.minimax_value > best_value : node.minimax_value < best_value
  end

  def set_best_value(take_maximum)
    take_maximum ? Float::INFINITY * - 1 : Float::INFINITY
  end
end
