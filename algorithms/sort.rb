

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
# - Best known worst case: О(n log^2 n)
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

# Time Complexity:
# - Worst : О(n^2)
# - Best Average: О(n log(n))
# - Best case: O(n log(n))
def quick_sort(arr, first, last)
    if first < last
        pivot_index = partition(arr, first, last)
        quick_sort(arr, first, pivot_index-1)
        quick_sort(arr, pivot_index+1, last)
    end
    arr
end

def partition(arr, first, last)
    pivot_value = arr[first]
    left_pos = first + 1
    right_pos = last
    done = false

    until done
        while left_pos <= right_pos and arr[left_pos] <= pivot_value
            left_pos += 1
        end

        while right_pos >= left_pos and arr[right_pos] >= pivot_value
            right_pos -= 1
        end

        if right_pos <= left_pos
            done = true
        else
            # Swap to keep values lesser and greater than pivot value
            arr[left_pos], arr[right_pos] = arr[right_pos], arr[left_pos]
        end
    end

    # Swap pivot value to its sorted position
    arr[first], arr[right_pos] = arr[right_pos], arr[first]
    right_pos
end

input_array = [7, 6, 21, 47, 26, 1, 12, 7]
input_array = [7, 47, 21, 47, 26, 31, 31, 47, 41, 14, 49, 6, 9, 36, 31, 15, 5, 36, 35, 25]

# sorted_array = bubble_sort(input_array)
# sorted_array = selection_sort(input_array)
# sorted_array = insertion_sort(input_array)
# sorted_array = shell_sort(input_array)
# sorted_array = merge_sort(input_array)
sorted_array = quick_sort(input_array, 0, input_array.size-1)
p sorted_array