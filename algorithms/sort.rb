

# Time Complexity: О(n^2)
def bubble_sort(arr)
    check_size = arr.size-1
    while (check_size > 0)
        (0..check_size-1).each do |i|
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
            end
        end
        check_size -= 1
    end
    arr
end

# Time Complexity: О(n^2)
def selection_sort(arr)
    check_size = arr.size-1
    (0..check_size).each do |i|
        # Assume first item as minimum value in the list
        min = i

        # Loop through unsorted items to identify the position of
        # value smaller (min) than the existing one
        ((i+1)..check_size).each do |j|
            min = j if arr[j] < arr[min]
        end

        # Swap the value in the position
        # This allows to move all minimum values step by step to left
        arr[i], arr[min] = arr[min], arr[i]
    end
    arr
end

# Time Complexity: О(n^2)
def insertion_sort(arr)
    # Consider first element as sorted.
    # Hence loop from 1st position to end of position to compare one by one
    (1..arr.size-1).each do |i|
        value = arr[i]

        # Compare the selected value with sorted set
        # (items present less than i th position) of an array
        j = i-1
        while j >= 0 and arr[j] > value
            arr[j+1], arr[j] = arr[j], value
            j -= 1
        end
    end
    arr
end

# Time Complexity:
# - Worst known worst case: О(n^2)
# - Worst known worst case: О(n log^2 n)
# - Best case: O(n log n)
# upgraded version of insertion sort
# Perform insertion sort in subsets of the provided list
def shell_sort(arr)
    # Identify gap to split subset
    gap = arr.size / 2
    while gap > 0
        # Process the list in subsets
        (gap..(arr.size - 1)).each do |i|
            j = i - gap

            # Perform insertion sort in the subset
            while j >= 0 and arr[i] < arr[j]
                arr[i], arr[j] = arr[j], arr[i]
                i, j = j, j-gap
            end
        end
        gap = gap / 2
    end
    arr
end

# Time Complexity: nlog(n)
def merge_sort(arr)
    arr_size = arr.size
    # Basic check
    return arr if arr_size <= 1
    
    # Split provided array into two parts
    mid = arr_size / 2
    left_arr = arr[0...mid]
    right_arr = arr[mid...arr_size]

    _merge(merge_sort(left_arr), merge_sort(right_arr))
end

# Merge feature implementation
def _merge(lset, rset)
    sorted = []

    # Compare arrays until any one becomes empty
    until lset.empty? or rset.empty?
        lset.first <= rset.first ? sorted << lset.shift : sorted << rset.shift
    end
    sorted + lset + rset
end

# With recursion the level is going very deep. Only a small list could be handled.
def quick_sort_recursion(arr)
    arr_size = arr.size
    # Basic check
    return arr if arr_size <= 1
    if arr_size == 2
        arr[0], arr[1] = arr[1], arr[0] if arr[0] > arr[1]
        return arr
    end

    # Consider first value as pivot.
    # Need to identify the correct position of the pivot value in the given array.
    pivot_value = arr[0]
    # Iterator index to move all the values greater than pivot value
    i = 1
    # Iterator index to move all the values lesser than pivot value
    j = arr_size - 1

    # Loop until i and j crosses each other
    loop do
        # Loop until you identify the first element greater than the pivot value
        while i <= arr_size-1 and arr[i] <= pivot_value 
            i += 1
        end
        # Loop until you identify the first element lesser than the pivot value
        while j >= 0 and arr[j] > pivot_value
            j -= 1
        end
        # Swap those two elements
        i < j ? (arr[i], arr[j] = arr[j], arr[i]) : break
    end
    # Swap the pivot value to its position.
    # At this point all the values to the left of the pivot value will be lesser
    # whereas the values to right will be greater than the pivot value
    arr[0], arr[j] = arr[j], arr[0]
    arr[0..j] = quick_sort(arr[0..j])
    arr[i..arr_size - 1] = quick_sort(arr[i..arr_size - 1])
    arr
end

# Quick Sort without recurssion.
# TODO: Not able to handle duplicate values.
def quick_sort(arr)
    arr_size = arr.size
    # Basic check
    return arr if arr_size <= 1
    if arr_size == 2
        arr[0], arr[1] = arr[1], arr[0] if arr[0] > arr[1]
        return arr
    end

    # Consider first value as pivot.
    # Need to identify the correct position of the pivot value in the given array.
    container = []

    container << [0, arr_size-1]

    loop do
        container.each do |p|
            start_index = p[0]
            last_index = p[1]
            pivot_value = arr[start_index]

            if (start_index..last_index).count == 2
                arr[0], arr[1] = arr[1], arr[0] if arr[0] > arr[1]
                container.shift
                break
            end

            i = start_index + 1
            j = last_index

            # Loop until you identify the first element greater than the pivot value
            while i <= last_index and arr[i] < pivot_value 
                i += 1
            end

            # Loop until you identify the first element lesser than the pivot value
            while i <= last_index and j >= start_index and arr[j] > pivot_value
                j -= 1
            end

            # Swap those two elements
            if i < j
                arr[i], arr[j] = arr[j], arr[i]
            else
                # if j > start_index or i <= last_index
                if start_index != j
                    arr[start_index], arr[j] = arr[j], arr[start_index]
                    container << [start_index, j]
                end
                container << [j+1, last_index] if j != last_index
                container.shift
                break
            end
        end
        break if container.empty?
    end
    arr
end

input_array = [7, 6, 21, 47, 26, 1, 12]
# input_array = [7, 47, 21, 47, 26, 31, 31, 47, 41, 14, 49, 6, 9, 36, 31, 15, 5, 36, 35, 25]

# sorted_array = bubble_sort(input_array)
# sorted_array = selection_sort(input_array)
# sorted_array = insertion_sort(input_array)
# sorted_array = shell_sort(input_array)
# sorted_array = merge_sort(input_array)
# sorted_array = quick_sort_recursion(input_array)
sorted_array = quick_sort(input_array)
p sorted_array