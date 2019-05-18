

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

def shell_sort(arr)
end

#input_array = [7, 47, 21, 47, 26, 31, 31, 47, 41, 14, 49, 6, 9, 36, 31, 15, 5, 36, 35, 25]
input_array = [7, 6, 21, 47, 26, 1]

# sorted_array = bubble_sort(input_array)
# sorted_array = selection_sort(input_array)
sorted_array = insertion_sort(input_array)
p sorted_array