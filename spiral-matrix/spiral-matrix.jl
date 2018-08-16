function spiralMove(currentDirection::Tuple,
                    currentPosition::Array,
                    filledCells::Set,
                    positions::Set,
                    directions::Dict,
                    n::Int
                    )
    """
    If we think about building a spiral array in sequence, 
    this function tells the builder of the array where to move
    to, from the current position. For example we start in cell
    (1,1), move to (1,2), then to (1,3) etc.
    
    This funciton also, inplace, modifies the record of cells that have 
    already been visited, and therefore filled, as well as the spiral array itself.
    """
    
    tmpNextPos = [i + j for (i,j) in zip(currentDirection, currentPosition)] 
    if (tmpNextPos in setdiff(positions, filledCells))
        newDirection = currentDirection
        newPos = tmpNextPos
    else
        newDirection = directions[currentDirection]
        newPos =  [i + j for (i,j) in zip(newDirection, currentPosition)]
    end
    
    union!(filledCells, [newPos])
    return newPos, newDirection
end

function spiral_matrix(n::Int)
    
    
    """
    This is the main control function which, after setting up the arrays to store
    the required information about position, direction of movement through the array,
    and previously filled cells, moves through the cells of the spiral array in the 
    desired order and fills in the desired values.
    """
    currentDirection = (0,1)
    currentPosition = [1,1]

    filledCells = Set([[1,1]])
    positions = Set([])

    for i in 1:n
        union!(positions, [[i,j] for j in 1:n])
    end

    directions = Dict(
        (0,1) => (1,0),
        (1,0) => (0,-1),
        (0,-1) => (-1,0),
        (-1,0) => (0,1)
    )

    total_square = n^2
    spiralArray = zeros(Int, (n,n))

    for fillValue in 1:n^2
        spiralArray[currentPosition...] = fillValue
        currentPosition, currentDirection = spiralMove(currentDirection,
                                                    currentPosition,
                                                    filledCells,
                                                    positions,
                                                    directions,
                                                    n)
    end
    spiralArray
end