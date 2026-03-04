wear_protocol = Proto("Wear",  "Wear")

len = ProtoField.uint32("wear.len", "Length", base.DEC)
wear_protocol.fields = { len }

function wear_protocol.dissector(buffer, pinfo, tree)
  length = buffer:len()
  if length == 0 then return end

  pinfo.cols.protocol = wear_protocol.name

  local subtree = tree:add(wear_protocol, buffer(), "Wear Payload")

  local protobuf_dissector = Dissector.get("protobuf")

  local offset = 0
  while offset < buffer:len() do
    print(string.format("Dissecting %d/%d", offset, buffer:len()))
    local working_buf = buffer(offset):tvb()
    local protobuf_len = working_buf(0, 4):uint()
    local protobuf_buffer = working_buf
    print(string.format("Buf Len %d", protobuf_len))
    
    -- Heuristic
    if protobuf_len < 2048 or working_buf:len() == 4 then
      subtree:add(len, working_buf(0,4))
      protobuf_buffer = working_buf(4, protobuf_len):tvb()
    end

    pcall(Dissector.call, protobuf_dissector, protobuf_buffer, pinfo, tree)

    offset = offset + protobuf_len + 4

    if protobuf_len >= working_buf:len() then
      break
    end

  end
end
